<nav class="navbar navbar-expand-lg navbar-light bg-light">
<div class="container">
  <a class="navbar-brand" href="#">BHH&ITECH</a>
    <ul class="navbar-nav">
      <li class="nav-item">
        <?php if(isLoggedIn()):?>
          <li class="nav-item"><a class="nav-link active" aria-current="page" href="index.php/logout">Logout</a></li>      
        <?php endif;?>
        <?php if(!isLoggedIn()):?>
          <li class="nav-item"><a class="nav-link active" aria-current="page" href="index.php/login">Login</a></li>   
        <?php endif;?>
      </li>
          <?php if(!isLoggedIn()):?>
      <li class="nav-item">
          <a class="nav-link" href="index.php/register">Registrieren</a>
      </li>
        <?php endif;?>
        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">All Products</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                                <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                            </ul>
                        </li>
    </ul>
    <form class="d-flex">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                                    <a href="index.php/cart">Warenkorb <span class="badge bg-dark text-white ms-1 rounded-pill"><?= $countCartItems ?></span></a>
                        </button>
                    </form>
</div>
</nav>

