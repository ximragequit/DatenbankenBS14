
      

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Product Card/Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="style.css">
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
  </head>
  <body>
    
  <?php require_once __DIR__.'/header.php'?>
    <br> <br> <br> <br><br><br><br>
    <div class = "card-wrapper">
      <div class = "cards">
        <!-- cards left -->
        <div class = "product-imgs">
          <div class = "img-display">
            <div class = "img-showcase">
              <img src = "http://localhost/shop/templates/T-Shirt/T-Shirt4.png" alt = "shoe image">
              <img src = "http://localhost/shop/templates/T-Shirt/T-Shirt rot hinten Frau.png" alt = "shoe image">
              <img src = "http://localhost/shop/templates/T-Shirt/T-Shirt rot Seite Frau.png" alt = "shoe image">
              <img src = "http://localhost/shop/templates/T-Shirt/T-Shirt rot Stoff.png" alt = "shoe image">
            </div>
          </div>
          <div class = "img-select">
            <div class = "img-item">
              <a href = "#" data-id = "1">
                <img src = "http://localhost/shop/templates/T-Shirt/T-Shirt4.png" alt = "shoe image">
              </a>
            </div>
            <div class = "img-item">
              <a href = "#" data-id = "2">
                <img src = "http://localhost/shop/templates/T-Shirt/T-Shirt rot hinten Frau.png" alt = "shoe image">
              </a>
            </div>
            <div class = "img-item">
              <a href = "#" data-id = "3">
                <img src = "http://localhost/shop/templates/T-Shirt/T-Shirt rot Seite Frau.png" alt = "shoe image">
              </a>
            </div>
            <div class = "img-item">
              <a href = "#" data-id = "4">
                <img src = "http://localhost/shop/templates/T-Shirt/T-Shirt rot Stoff.png" alt = "shoe image">
              </a>
            </div>
          </div>
        </div>
        <!-- cards right -->
        <div class = "product-content">
          <h2 class = "product-title">Tshirt Frauen Rot</h2>
          <div class = "product-rating">
            <i class = "fas fa-star"></i>
            <i class = "fas fa-star"></i>
            <i class = "fas fa-star"></i>
            <i class = "fas fa-star"></i>
            <i class = "fas fa-star-half-alt"></i>
            <span>4.7(21)</span>
          </div>

          <div class = "product-price">
            
          <p class = "new-price">Neuer Preis <span>14,99 €</span></p>
          </div>

          <div class = "product-detail">
            <h2>Über das Produkt: </h2>
            <p>Dies ist der Merch von der BHH und der ITECH. Es symbolisiert die enge Zusammenarbeit zwischen Lernorten.</p>
            <p>Das Tshirt besteht aus hochwertiger Baumwolle und entspricht dem hohen Qualitätsmaßstab, den wir uns gesetzt haben!</p>
            <ul>
                <select style="margin-right: 10cm;" size="1" class="form-select form-select-sm" aria-label=".form-select-lg example">  
                  <option>Small (S)</option>
                  <option>Medium (M)</option>
                  <option selected>Large (L)</option>
                  <option>Extra Large (XL)</option>
                </select><br>
              <b>Category: </b><span>T-Shirt</span><br>
              <b>Shipping Area:</b> <span>All over the world</span><br>
              <b>Shipping Fee:</b> <span>Free</span>
            </ul>
          </div>

          <div class = "purchase-info">
            <input type = "number" min = "0" value = "1"><br>
            <a class="btn btn-outline-dark mt-auto" href="index.php/cart/add/4" class="btn btn-success btn-sm">In den Warenkorb</a>
          </div>

          <div class = "social-links">
            <p>Share At: </p>
            <a href = "#">
              <i class = "fab fa-facebook-f"></i>
            </a>
            <a href = "#">
              <i class = "fab fa-twitter"></i>
            </a>
            <a href = "#">
              <i class = "fab fa-instagram"></i>
            </a>
            <a href = "#">
              <i class = "fab fa-whatsapp"></i>
            </a>
            <a href = "#">
              <i class = "fab fa-pinterest"></i>
            </a>
          </div>
        </div>
      </div>
    </div>
    <?php require_once __DIR__.'/footer.php'?>

  <!-- Bootstrap core JS-->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <script src="http://localhost/shop/templates/script.js"></script>
  </body>
</html>