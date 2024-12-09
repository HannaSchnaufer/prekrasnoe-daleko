<?php
try {
    // Koneksi ke database menggunakan PDO
    $conn = new PDO("mysql:host=localhost;dbname=articles_db", "root", "");
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Koneksi gagal: " . $e->getMessage());
}

// Menyiapkan query dasar
$sql = "
    SELECT 
        articles.id,
        articles.title,
        articles.image_url,
        articles.content,
        factions.name AS faction_name,
        roles.name AS role_name,
        categories.name AS category_name
    FROM articles
    LEFT JOIN factions ON articles.faction_id = factions.id
    LEFT JOIN roles ON articles.role_id = roles.id
    LEFT JOIN categories ON articles.category_id = categories.id
";

// Array untuk filter yang valid
$filters = [];

// Menambahkan filter berdasarkan kategori jika ada
if (isset($_GET['category'])) {
    $category = htmlspecialchars($_GET['category']); // Sanitasi input
    $filters[] = "categories.name = :category";
}

// Menambahkan filter berdasarkan peran jika ada
if (isset($_GET['role'])) {
    $role = htmlspecialchars($_GET['role']); // Sanitasi input
    $filters[] = "(roles.name = :role OR roles.name IS NULL)";
}

// Menambahkan filter berdasarkan faksi jika ada
if (isset($_GET['faction'])) {
    $faction = htmlspecialchars($_GET['faction']); // Sanitasi input
    $filters[] = "(factions.name = :faction OR factions.name IS NULL)";
}

// Jika ada filter, gabungkan ke dalam query
if (!empty($filters)) {
    $sql .= " WHERE " . implode(" AND ", $filters);
}

// Menyiapkan dan mengeksekusi query
$stmt = $conn->prepare($sql);

// Binding parameter jika ada filter
if (isset($category)) {
    $stmt->bindParam(':category', $category);
}
if (isset($role)) {
    $stmt->bindParam(':role', $role);
}
if (isset($faction)) {
    $stmt->bindParam(':faction', $faction);
}

// Eksekusi query dan ambil hasilnya
$stmt->execute();
$articles = $stmt->fetchAll(PDO::FETCH_ASSOC);

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Monolith</title>
  <link rel="stylesheet" href="styles.css">
  <link href="https://fonts.googleapis.com/css2?family=Fira+Sans:wght@400;700&family=Playfair+Display:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>
<header>
    <h1><a href="index.php" style="text-decoration: none; color: inherit;">MONOLITH</a></h1>
    <nav>
        <a href="index.php">Home</a>
        <div class="dropdown">
            <a href="#">World in Conflict</a>
            <div class="dropdown-content">
                <a href="?category=units">Units</a>
                <div class="dropdown">
                    <a href="#">Role</a>
                    <div class="dropdown-content">
                        <a href="?role=Infantry">Infantry</a>
                        <a href="?role=Armor">Armor</a>
                        <a href="?role=Support">Support</a>
                        <a href="?role=Air">Air</a>
                    </div>
                </div>
                <a href="?category=tactical_points">Tactical Points</a>
            </div>
        </div>
        <div class="dropdown">
            <a href="#">Factions</a>
            <div class="dropdown-content">
                <a href="?faction=NATO">NATO</a>
                <a href="?faction=USSR">USSR</a>
            </div>
        </div>
    </nav>
</header>

<main>
    <section class="cards">
        <?php if ($articles && count($articles) > 0): ?>
            <?php foreach ($articles as $row): ?>
                <article class="card">
                    <a href="article.php?id=<?= $row['id'] ?>">
                        <img src="<?= $row['image_url'] ?>" alt="<?= htmlspecialchars($row['title']) ?>">
                        <h2><?= htmlspecialchars($row['title']) ?></h2>
                        <p><?= htmlspecialchars(substr($row['content'], 0, 100)) ?>...</p>
                    </a>
                    <div class="tags">
                        <span class="tag">Faction: <a href="?faction=<?= $row['faction_name'] ?>"><?= htmlspecialchars($row['faction_name'] ?? 'Unknown') ?></a></span>
                        <span class="tag">Role: <a href="?role=<?= $row['role_name'] ?>"><?= htmlspecialchars($row['role_name'] ?? 'None') ?></a></span>
                    </div>
                </article>
            <?php endforeach; ?>
        <?php else: ?>
            <p>No articles found for the selected filter.</p>
        <?php endif; ?>
    </section>
</main>
</body>
</html>
