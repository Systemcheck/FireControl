<?php
session_start();
session_destroy();

header("Location: index.php?message=Logout erfolgreich. ", true, 301);
?>