<?php

    include 'db.php';
    include 'online.php';

    if(isset($_GET['ajax_act'])){
        $id=$_SESSION['id'];
        if($_GET['ajax_act']=="like_post"){
            if(isset($_POST['pid'])&&is_numeric($_POST['pid'])){
                   
                        $post_id = $_POST['pid'];
                        $query = $connection->query(" SELECT * FROM likes WHERE post_id = $post_id AND user_id = $id ");
    
                if($row = $query->fetch_object()){
                  
                        $connection->query("DELETE FROM likes WHERE user_id = $id AND post_id = $post_id");

                }else{
        
                        $connection->query("INSERT INTO likes VALUES (NULL, $id, $post_id) ");
        
                        $query = $connection->query(" SELECT COUNT(id) likes_amnt FROM likes WHERE post_id = $post_id LIMIT 1 ");

                    if($row=$query->fetch_object()){
            
                            $size = $row->likes_amnt;
            
                            $connection->query("UPDATE walls SET like_value = $size WHERE id = $post_id");
                    }
        
                }

        $sql = "SELECT * FROM walls WHERE id = $post_id ";
        $query=$connection->query($sql);
        $like_value=0;
        
        if($row=$query->fetch_object()){
         
            $like_value = $row->like_value;
            
        }

        echo $like_value;

      }

    }
}else{ 

    if($online){
        
        $page="pages/online/profile";
            
            if(isset($_GET['act'])){

                if($_GET['act']=="status"){

                    $id = $_SESSION['id'];

                    $status_value = $_POST['status'];

                    $query = $connection->query("SELECT * FROM user_status WHERE user_id=$id");

                    if($query->fetch_object()){
                        $sql_text_status = "UPDATE user_status SET status_value = \"$status_value\" WHERE user_id=$id";
                        $connection->query($sql_text_status);
                        echo $sql_text_status;
                    }else{
                        $sql_text = "INSERT INTO user_status(id,user_id,status_value)
                        VALUES(NULL,$id,\"$status_value\")";

                        $connection->query($sql_text);
                    }
                    header("location:?page=profile");
                
                      
                }else if($_GET['act']=="photo"){

                    $id = $_SESSION['id'];
                    $file = $_FILES['picture_upload'];
                    $temp_file = $_FILES['picture_upload'];
                    $salt ="LOLOLOLOL";
           
                    $type = $file['type'];
                    $url ="";

                    if($type=="image/jpg"){
                        
                        $file_name = sha1(rand()+$salt).".jpg";
                        $url = "img/$file_name";
                    
                    }else if($type=="image/jpeg"){
                    
                        $file_name = sha1(rand()+$salt).".jpeg";
                        $url = "img/$file_name";
                    
                    }else if($type=="image/png"){
                    
                        $file_name = sha1(rand()+$salt).".png";
                        $url = "img/$file_name";
                    }

                        $sql_picture = "INSERT INTO user_pictures(id,user_id,url,post_date,is_avatar,active)
                                        VALUES(NULL,$id,\"$url\",NOW(),0,1)";

                                $connection->query($sql_picture);

                    move_uploaded_file($_FILES['picture_upload']['tmp_name'],"img/$file_name");

                    header("location:?page=photos");


                }else if($_GET['act']=="set_avatar"){
                        
                    $id = $_SESSION['id'];
                    $sql_text_avatar = "UPDATE user_pictures SET is_avatar = 0 WHERE is_avatar=1 AND user_id = $id";
                    $connection->query($sql_text_avatar);
                    $url = $_POST['url'];
                    $pic_id =$_POST['id'];

                    $sql_text = "UPDATE user_profile SET avatar_url = \"$url\" WHERE user_id =$id";
                    $sql_text_pic = "UPDATE user_pictures SET is_avatar = 1 WHERE id = $pic_id";

                    $connection->query($sql_text);
                    $connection->query($sql_text_pic);

                }else if($_GET['act']=="delete_photo"){
 
                    $url = $_POST['url'];
                    $pic_id =$_POST['id'];

                    $query=$connection->query("SELECT *FROM user_pictures WHERE id=$pic_id AND active =1");
                    
                    if($row=$query->fetch_object()){
                        if($row->is_avatar==1){
        
                                    $sql_null = "";
                                    $sql_null = "UPDATE user_pictures SET active = 0 WHERE id = $pic_id";
                                    $sql_text = "UPDATE user_profile SET avatar_url = \"$sql_null\" ";
                                        $connection->query($sql_text);
                                        $connection->query($sql_null);
                        }else{
                                 $sql_text = "UPDATE user_pictures SET active = 0 WHERE id = $pic_id";
                                        $connection->query($sql_text);
                        }
                    }
                       
                }else if($_GET['act']=="post"){
                    
                    if($_POST['text']!=""){
                        
                        $text = $_POST['text'];
                            $id = $_SESSION['id'];
                                $sql_text="INSERT INTO walls(id,user_id,post_text,post_date,active)
                                            VALUES(NULL,$id,\"$text\",NOW(),1)";

                                    $connection->query($sql_text);
                         
                         header("location:?page=profile");   
                    }

                }else if($_GET['act']=="comment"){
                    
                    if($_POST['comment']!=""){
                         
                         $id=$_SESSION['id'];
                            $wall_id = $_POST['wall_id'];
                                $text = $_POST['comment'];

                                    $sql_text = "INSERT INTO wall_comments(id,wall_id,user_id,comment,comment_date,active) 
                                                VALUES(NULL,$wall_id,$id,\"$text\",NOW(),1)";
                                    $connection->query($sql_text);
                                    echo $sql_text;
                                    header("location:?page=profile"); 
                    }
                   
                }else if($_GET['act']=="edit_post"){
                   
                    $post_id = $_POST['post_id'];
                    $text = $_POST['text'];
                    $sql_text= "UPDATE walls SET post_text=\"$text\" WHERE id= $post_id";
                    $connection->query($sql_text);
                    echo $sql_text;
                    header("location:?page=profile"); 
                
                }else if($_GET['act']=="edit_profile"){
                    $id=$_SESSION['id'];
                    $name = $_POST['name'];
                    $surname = $_POST['surname'];
                    $sql_text = "UPDATE user_profile SET name = \"$name\" AND surname = \"$surname\" WHERE user_id = $id";
                    $connection->query($sql_text);
                    echo $sql_text;
                    //header("location:?page=profile"); 
                }else if($_GET['act']=="delete_post"){
                   
                    $post_id = $_POST['post_id'];
                    $text = $_POST['text'];
                    $sql_text= "UPDATE walls SET active=0 WHERE id= $post_id";
                    $connection->query($sql_text);
                    echo $sql_text;
                    header("location:?page=profile"); 
                
                }else if($_GET['act']=="logout"){
                    session_unset();
                    header("location:?page=logout");
                  

                }else if($_GET['act']=="visit"){
                    
                    

                    header("location:?page=visit");

                }else if($_GET['act']=="friend"){

                    $friend_id = $_POST['id'];
                    echo $friend_id;
                    $user_id = $_SESSION['id'];
                    $sql = "INSERT INTO friend_requests(id,user_id,friend_id,sent_date)
                            VALUES(NULL,$user_id,$friend_id,NOW())";

                    $connection->query($sql);
                    header("location:?page=visit&id=$friend_id");

                }else if($_GET['act']=="yes"){
                    
                    $friend_id = $_POST['id'];
                    echo $friend_id;
                    $user_id = $_SESSION['id'];
                    echo $user_id;
                    $connection->query(" DELETE FROM friend_requests WHERE friend_id = $user_id ");
                    $sql = "INSERT INTO friends(id,user_id,friend_id)
                            VALUES(null,$user_id,$friend_id)
                    ";
                    $sql2 = "INSERT INTO friends(id,user_id,friend_id)
                            VALUES(null,$friend_id,$user_id)
                    ";
                    $connection->query($sql);
                    $connection->query($sql2);
                    //header("location:?page=request");
                }else if($_GET['act']=="no"){

                    $friend_id=$_POST['id'];
                    $user_id = $_SESSION['id'];
                    $connection->query(" DELETE FROM friend_requests WHERE friend_id = $user_id ");
                    header("location:?page=request");
                }else if($_GET['act']=="undo"){
                    $friend_id=$_POST['id'];
                    $user_id = $_SESSION['id'];

                    $connection->query(" DELETE FROM friend_requests WHERE friend_id = $friend_id ");
                    header("location:?page=my_request");
                }else if($_GET['act']=="message"){
                    
                    $id = $_SESSION['id'];
                    $friend_id = $_POST['friend_id'];
                    $text = $_POST['text'];
                    echo $friend_id;
                    echo $text;
                    $sql = "INSERT INTO messages(id,user_id,sender_id,message,readen,user_deleted,sender_deleted,sent_date)
                            VALUES (NULL,$friend_id,$id,\"$text\",0,0,0,NOW())";
                    $connection->query($sql); 
                     
                    header("location:?page=message");

                }else if($_GET['act']=="chat"){
                    $user_id = $_SESSION['id'];
                    $sender_id = $_GET['id'];

                    

                    

                    header("location:?page=chat&id=$sender_id");


                }else if($_GET['act']=="chat_message"){
                    $id = $_SESSION['id'];
                    $friend_id = $_POST['friend_id'];
                    $text = $_POST['text'];
                    echo $friend_id;
                    echo $text;
                    $sql = "INSERT INTO messages(id,user_id,sender_id,message,readen,user_deleted,sender_deleted,sent_date)
                            VALUES (NULL,$friend_id,$id,\"$text\",0,0,0,NOW())";
                    $connection->query($sql); 
                     
                    header("location:?page=chat&id=$friend_id");
                }
           }

            if(isset($_GET['page'])){
                if($_GET['page']=="profile"){
                    
                    $page= "pages/online/profile";
                
                }else if($_GET['page']=="photos"){
                
                    $page = "pages/online/photos";
                
                }else if($_GET['page']=="logout"){
                
                    $page="pages/offline/signin";

                }else if($_GET['page']=="search"){
 
                    $page= "pages/online/search";

                }else if($_GET['page']=="visit"){

                    $page = "pages/online/visit";

                }else if($_GET['page']=="friends"){

                    $page="pages/online/friends";

                }else if($_GET['page']=="request"){
                 
                    $page = "pages/online/requests";
                
                }else if($_GET['page']=="my_request"){
                 
                    $page="pages/online/my_request";
                
                }else if($_GET['page']=="message"){

                    $page = "pages/online/message";               
                
                }else if($_GET['page']=="chat"){
                 
                    $page="pages/online/chat";
                
                }else if($_GET['page']=="question"){
                    $page="pages/online/question";
                }
            }




?> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"> 
        <meta charset="utf-8">
        <title></title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <!--[if lt IE 9]>
          <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <link href="assets/css/facebook.css" rel="stylesheet">
    </head>

<body>
    <div class="wrapper">
        <div class="box">
                <div class="row row-offcanvas row-offcanvas-left">
                    
                    <?php include 'templates/online/slidebar.php';?>
                  
                    <!-- main right col -->
                    <div class="column col-sm-10 col-xs-11" id="main">
                        
                        <?php include 'templates/online/header.php';?>
                      
                        <div class="padding">
                            <div class="full col-sm-9">
                              
                        <?php include $page.'.php';?>
                                
                              
                            </div><!-- /col-9 -->
                        </div><!-- /padding -->
                    </div>
                    <!-- /main -->
                  
                </div>
            </div>
        </div>


        <!--post modal-->
     


        
        <script type="text/javascript" src="assets/js/jquery.js"></script>
        <script type="text/javascript" src="assets/js/bootstrap.js"></script>
        <script type="text/javascript">
        $(document).ready(function() {
            $('[data-toggle=offcanvas]').click(function() {
                $(this).toggleClass('visible-xs text-center');
                $(this).find('i').toggleClass('glyphicon-chevron-right glyphicon-chevron-left');
                $('.row-offcanvas').toggleClass('active');
                $('#lg-menu').toggleClass('hidden-xs').toggleClass('visible-xs');
                $('#xs-menu').toggleClass('visible-xs').toggleClass('hidden-xs');
                $('#btnShow').toggle();
            });
        });
        </script>


    
</body>

 

    <!-- jQuery Version 1.11.1 -->
    <script src="bootstrap/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="bootstrap/js/bootstrap.min.js"></script>



</html>



<?php

    }else{

            $page="pages/offline/signin";



            if(isset($_GET['act'])){

                if($_GET['act']=="signup"){
                        
                        $info = $_SESSION['info'];
                        $login = $info['login'];

                        $password=sha1($info['password']);
                        $country_id=$info['country_id'];
                        $email=$info['email'];

                        $name = $_POST['name'];
                        $surname = $_POST['surname'];
                        $gender = $_POST['gender'];
                        $city_id = $_POST['city'];
                        $day = $_POST['day'];
                        $month = $_POST['month'];
                        $year = $_POST['year'];
                        $birthDate = $year.'-'.$month.'-'.$day;
                        $dob = new DateTime($birthDate);
                        $interval = $dob->diff(new DateTime);
                        $age = $interval->y;
                        $file = $_FILES['picture_upload'];


                        $sql_users = "INSERT INTO users(id,login,password,email,active)
                                      VALUES(NULL,\"$login\",\"$password\",\"$email\",1)";
                        $connection->query($sql_users);

                        $id= $connection->insert_id;

                        $temp_file = $_FILES['picture_upload'];
                        $salt ="LOLOLOLOL";
               
                         $type = $file['type'];
                        $url ="";

                        if($type=="image/jpg"){
                             $file_name = sha1(rand()+$salt).".jpg";
                             $url = "img/$file_name";
                        }
                        if($type=="image/jpeg"){
                            $file_name = sha1(rand()+$salt).".jpeg";
                            $url = "img/$file_name";
                        }
                        if($type=="image/png"){
                            $file_name = sha1(rand()+$salt).".png";
                            $url = "img/$file_name";
                        }


                        $sql_profile = "INSERT INTO user_profile(id,user_id,name,surname,birth_date,country_id,city_id,age,gender,avatar_url)
                                        VALUES (NULL,$id,\"$name\",\"$surname\",\"$birthDate\",\"$country_id\",\"$city_id\",$age,\"$gender\",\"$url\")


                        ";
                        $connection->query($sql_profile);
                        move_uploaded_file($_FILES['picture_upload']['tmp_name'],"img/$file_name");


                        $sql_picture = "INSERT INTO user_pictures(id,user_id,url,post_date,is_avatar)
                                        VALUES(NULL,$id,\"$url\",NOW(),1)

                            ";

                         $connection->query($sql_picture);   

                        header("Location:?page=signin");




           
            }else if($_GET['act']=="auth"){
                    $login=$_POST['login'];
                    $password=sha1($_POST['password']);
                    $sql_text = "SELECT * FROM users WHERE login = \"$login\" AND password = \"$password\" AND active=1";
                    $query = $connection->query($sql_text);
 echo $sql_text;
                    if($row=$query->fetch_object()){

                                $_SESSION['id']=$row->id;
                                $_SESSION['password']=$password;
                                header("location:?page=profile");
                            }
            }
}


        if(isset($_GET['page'])){
            if($_GET['page']=="signup"){
                $page = "pages/offline/signup";
            }else if($_GET['page']=="signin"){
                $page = "pages/offline/signin";
            }
        }



     ?>
     <!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"> 
        <meta charset="utf-8">
        <title>Facebook Theme Demo</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <!--[if lt IE 9]>
          <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <link href="assets/css/facebook.css" rel="stylesheet">
    </head>
<body >


    <!-- Page Content -->
    <div class="container">

        <div class="row">
            <div class="col-lg-12">


                
                <?php            
                    include $page.'.php';
                ?>            

        </div>
        <!-- /.row -->

    </div>
    <!-- /.container -->
    </body>
 <div class = "col-lg-12"></div>

<footer style ="position:fixed; bottom:0"> 

<div class="row">
<div class = "col-lg-2"></div> 
<div class="col-lg-6"> 
<p>Copyright &copy; Your Website 2016</p> 
</div> 
</div> 

</footer> 

    <!-- jQuery Version 1.11.1 -->
    <script src="bootstrap/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="bootstrap/js/bootstrap.min.js"></script>



</html>




      <?php       



    }

}

?>



