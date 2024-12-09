<?php
try {
    // Koneksi ke database menggunakan PDO
    $conn = new PDO("mysql:host=localhost;dbname=articles_db", "root", "");
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Koneksi gagal: " . $e->getMessage());
}

// Mengambil ID artikel dari URL, memastikan ID adalah integer
$article_id = isset($_GET['id']) ? intval($_GET['id']) : 0;

if ($article_id > 0) {
    // Query untuk mendapatkan artikel berdasarkan ID
    $sql = "
        SELECT 
            articles.title, 
            articles.content, 
            articles.image_url, 
            factions.name AS faction_name, 
            roles.name AS role_name 
        FROM articles
        LEFT JOIN factions ON articles.faction_id = factions.id
        LEFT JOIN roles ON articles.role_id = roles.id
        WHERE articles.id = :article_id
    ";
    
    // Menyiapkan query
    $stmt = $conn->prepare($sql);
    // Mengikat parameter untuk query
    $stmt->bindParam(':article_id', $article_id, PDO::PARAM_INT);
    // Menjalankan query
    $stmt->execute();

    // Mengambil hasil artikel
    $article = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if (!$article) {
        // Artikel tidak ditemukan
        die("Artikel tidak ditemukan.");
    }
} else {
    // Jika ID artikel tidak valid
    die("Artikel tidak ditemukan.");
}

// Query untuk mengambil artikel terkait berdasarkan faksi atau peran yang sama
$related_sql = "
    SELECT id, title FROM articles
    WHERE 
        (faction_id = (SELECT faction_id FROM articles WHERE id = :article_id) OR faction_id IS NULL)
        OR 
        (role_id = (SELECT role_id FROM articles WHERE id = :article_id) OR role_id IS NULL)
    AND id != :article_id
    LIMIT 12
";
$related_stmt = $conn->prepare($related_sql);
$related_stmt->bindParam(':article_id', $article_id, PDO::PARAM_INT);
$related_stmt->execute();
$related_articles = $related_stmt->fetchAll(PDO::FETCH_ASSOC);

// Menambahkan komentar baru
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['comment_text'])) {
    $author_name = htmlspecialchars($_POST['author_name']);
    $comment_text = htmlspecialchars($_POST['comment_text']);

    // Masukkan komentar ke dalam database
    $insert_sql = "
        INSERT INTO comments (article_id, author_name, comment_text)
        VALUES (:article_id, :author_name, :comment_text)
    ";
    $insert_stmt = $conn->prepare($insert_sql);
    $insert_stmt->bindParam(':article_id', $article_id, PDO::PARAM_INT);
    $insert_stmt->bindParam(':author_name', $author_name, PDO::PARAM_STR);
    $insert_stmt->bindParam(':comment_text', $comment_text, PDO::PARAM_STR);
    $insert_stmt->execute();

    // Redirect untuk menghindari pengiriman form ganda
    header("Location: article.php?id=$article_id");
    exit();
}

// Query untuk mengambil komentar berdasarkan article_id
$comment_sql = "
    SELECT author_name, comment_text, created_at 
    FROM comments
    WHERE article_id = :article_id
    ORDER BY created_at DESC
";
$comment_stmt = $conn->prepare($comment_sql);
$comment_stmt->bindParam(':article_id', $article_id, PDO::PARAM_INT);
$comment_stmt->execute();
$comments = $comment_stmt->fetchAll(PDO::FETCH_ASSOC);
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars($article['title']) ?></title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<header>
    <h1><a href="index.php" style="text-decoration: none; color: inherit;">MONOLITH</a></h1>
    <nav>
        <a href="index.php">Home</a>
        <div class="dropdown">
            <a href="#">World in Conflict</a>
            <div class="dropdown-content">
                <a href="index.php?category=units">Units</a>
                <a href="index.php?category=tactical_points">Tactical Points</a>
            </div>
        </div>

        <div class="dropdown">
            <a href="#">Factions</a>
            <div class="dropdown-content">
                <a href="index.php?faction=NATO">NATO</a>
                <a href="index.php?faction=USSR">USSR</a>
        </div>
</div>

        </div>
    </nav>
</header>

<main class="article-page">
  <article class="details">
    <img src="<?= htmlspecialchars($article['image_url']) ?>" alt="<?= htmlspecialchars($article['title']) ?>">
    <h1><?= htmlspecialchars($article['title']) ?></h1>
    <p><?= nl2br(htmlspecialchars($article['content'])) ?></p>
    <div class="tags">
      <span class="tag">
        Faction: 
        <a href="index.php?faction=<?= urlencode($article['faction_name']) ?>">
          <strong><?= htmlspecialchars($article['faction_name'] ?? 'Unknown') ?></strong>
        </a>
      </span>
      <span class="tag">
        Role: 
        <a href="index.php?role=<?= urlencode($article['role_name']) ?>">
          <strong><?= htmlspecialchars($article['role_name'] ?? 'None') ?></strong>
        </a>
      </span>
    </div>
  </article>

  <aside class="sidebar">
    <h2>Related Articles</h2>
    <ul>
        <?php foreach ($related_articles as $related): ?>
            <li>
                <a href="article.php?id=<?= $related['id'] ?>"><?= htmlspecialchars($related['title']) ?></a>
            </li>
        <?php endforeach; ?>
    </ul>
  </aside>
</main>

  <!-- Bagian Komentar -->
<main class="article-page">
    <article class="details">
        <section class="comments">
            <h2>Comments</h2>
            <?php if ($comments): ?>
                <ul>
                    <?php foreach ($comments as $comment): ?>
                        <li>
                            <strong><?= htmlspecialchars($comment['author_name']) ?>:</strong>
                            <p><?= nl2br(htmlspecialchars($comment['comment_text'])) ?></p>
                            <small>Posted on: <?= htmlspecialchars($comment['created_at']) ?></small>
                        </li>
                    <?php endforeach; ?>
                </ul>
            <?php else: ?>
                <p>No comments yet. Be the first to comment!</p>
            <?php endif; ?>

            <!-- Form untuk menambah komentar -->
            <h3>Leave a Comment</h3>
            <form method="POST" action="article.php?id=<?= $article_id ?>">
                <label for="author_name">Name:</label>
                <input type="text" id="author_name" name="author_name" required>
                <label for="comment_text">Comment:</label>
                <textarea id="comment_text" name="comment_text" required></textarea>
                <button type="submit">Post Comment</button>
            </form>
        </section>
    </article>
</main>
</body>
</html>
