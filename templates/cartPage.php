<?php require_once __DIR__.'/header.php'?>
<section class="container" id="cartItems">
  <div class="row">
    <h2>Warenkorb</h2><br><br><br>
  </div>
  <div class="row cartItemHeader">
   
  </div>
  <?php foreach($cartItems as $cartItem):?>
  <div class="row cartItem">
      <?php include __DIR__.'/cartItem.php';?><br>
  </div>
  <?php endforeach;?>
  <div class="row">
    <div class="col-12 text-right">
      <b>Summe (<?= $countCartItems ?> Artikel): <span class="price"><?= $cartSum?></span> €</div></b>
    </div>
  </div>
  <div class="row">
    <a href="index.php/checkout"class="btn btn-primary col-12">Zur Kasse gehen</a>
  </div>
</section>
<?php require_once __DIR__.'/footer.php'?>
