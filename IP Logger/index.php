<?php

$ip = $_SERVER['REMOTE_ADDR'];
$File = fopen("ips.txt", "a");
fwrite($File, $ip."\n");
fclose($File);

?>
