
      

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
            
            <p class = "new-price">New Price: <span>19,99€</span></p>
          </div>

          <div class = "product-detail">
            <h2>about this item: </h2>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Illo eveniet veniam tempora fuga tenetur placeat sapiente architecto illum soluta consequuntur, aspernatur quidem at sequi ipsa!</p>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur, perferendis eius. Dignissimos, labore suscipit. Unde.</p>
            <ul>
              
              <li style="margin-right: 10cm;">
                <select size="1" class="form-select form-select-sm" aria-label=".form-select-lg example">  
                  <option>S</option>
                  <option>M</option>
                  <option selected>L</option>
                  <option>XL</option>
                </select></li>
              <li>Category: <span>Shoes</span></li>
              <li>Shipping Area: <span>All over the world</span></li>
              <li>Shipping Fee: <span>Free</span></li>
            </ul>
          </div>

          <div class = "purchase-info">
            <input type = "number" min = "0" value = "1">
            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="index.php/cart/add/4" class="btn btn-success btn-sm">In den Warenkorb</a></div>
            <button type = "button" class = "btn">Compare</button>
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