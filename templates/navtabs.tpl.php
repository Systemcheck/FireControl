<ul class="nav nav-tabs">
    <?php $c=0;foreach($tabs as $tab) { ?>
    <li <?php if($c==0) { ?> class="active"<?php $c++; } ?>><a data-toggle="tab" href="#<?php echo $tab; ?>"><?php echo $tab; ?></a></li>
    <?php } ?>
</ul>