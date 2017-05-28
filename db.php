<?php

	$connection = new mysqli("localhost","root","","facebook");

	if($connection->connect_error){
		echo "ERROR IN DB CONNECTION!";
	}


?>