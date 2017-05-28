<?php
	session_start();
	

	$online = false;
	if(isset($_SESSION['id']) && isset($_SESSION['password'])){
		$sqltext = "SELECT * FROM users WHERE id = ".$_SESSION['id']." AND password = \"".$_SESSION['password'] ."\" ";
		//echo $sqltext;
		$query = $connection->query($sqltext);
		
		if($row=$query->fetch_object()){
			$active = $row->active;
			if($active==1){
			$online = true;
		}

		
	}	
}

?>