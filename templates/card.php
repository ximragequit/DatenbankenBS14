

<div class="col mb-5">
                        <br><br><br><div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://placekitten.com/286/180" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"><?= $product['title']?></h5>
                                    <!-- Product price-->
                                    <?= $product['price'] ?>
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="index.php/cart/add/<?= $product['id']?>" class="btn btn-success btn-sm">In den Warenkorb</a></div>
                            </div>
                        </div>
                    </div>
