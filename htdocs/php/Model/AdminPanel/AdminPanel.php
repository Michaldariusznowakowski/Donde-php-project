<?php 
require_once 'php/Model/interface.php';
require_once 'php/Model/Database/Database.php';
class AdminPanel implements functions_for_model
{
    public function getViewParams($post)
    {
		session_start();
	
		$login = $_POST["login"];
		$haslo = $_POST["haslo"];
		
		/*
		$var = new Database();
		$conn = $var->dbConnection();
		
		
		
		$conn->exec("CREATE TABLE IF NOT EXISTS users (
			id INT PRIMARY KEY,
			login TEXT NOT NULL,
			haslo TEXT NOT NULL
		);");
		$conn->exec("INSERT IGNORE INTO users (id, login, haslo) VALUES (1, 'student', 'c8decb2f562cbe295637c905870be7a615c456db2aaa9372066a0d740aaf7123a78e56d91c4177048dc756067ab05a0dc74d33b15004ef4170b892e9ab38a0f6');");



		$sql="SELECT * FROM users WHERE login='$login'";
		$stmt = $conn->query($sql);
		$row = $stmt->fetch();		
		$hasloFromDatabase=$row['haslo'];
		*/
		
		$hasloFromDatabase='c8decb2f562cbe295637c905870be7a615c456db2aaa9372066a0d740aaf7123a78e56d91c4177048dc756067ab05a0dc74d33b15004ef4170b892e9ab38a0f6';
		
		$sol = md5("mnxfcgbuirtd");
		$sol2 = sha1("esrf537Ggc");
		$hash = hash('sha512', $haslo . $sol . $sol2);
		
		
		if($hasloFromDatabase ==$hash) {
			
			$output = array("status" => "OK");
			$output["pageName"] = "AdminPanel";
			
		}else{
			
			$output = array("status" => "NOT OK");
			$output["pageName"] = "AdminLogin";
			
		}
		
		
		
        # How to return values used in View
        # Input : array("a" => "one", "b" => "two", "c" => "three")
        # Extract(Input) : $a = "one" , $b = "two" , $c = "three"
        
        return $output;
    }
}