<?php
error_reporting(E_ALL);
ini_set('display_errors', 'On');
session_start();
    //from onid code snippet
    //delcare vars for login creds
    $dbhost = 'oniddb.cws.oregonstate.edu';
    $dbname = 'wilcoant-db';
    $dbuser = 'wilcoant-db';
    $dbpass = 'oBHvvoPmNh4NFz9n';
    $mysqli = new mysqli($dbhost, $dbuser, $dbpass, $dbname);
    if(!$mysqli || $mysqli->connect_errno)
    {//got from osu cs290 course lecture video
        echo "Connection error" . $mysqli->connect_errno. " ".$mysqli->connect_error;
    }
  
    
    function setup()
    {//setu up for ajax call number one onload to build table of inventory
        global $mysqli;
        $stmt = $mysqli->prepare("SELECT * FROM sensorcrop");
        $stmt->execute();
        $result = $stmt->get_result();
        listcrop($result);
        $stmt->close();
       
    }
    
   
   
   function listcrop($result)
   {//table build from object returned from sql select * query
       echo '<table class="croplist">';
       echo '<tr>';
       echo '<th id = "sid">Sensor ID Number</th>';
       echo '<th id = "cid">Crop ID Number</th>';
       echo '</tr>';
       //got from http://php.net/manual/en/mysqli-result.fetch-assoc.php
       ///example 1
       while($row = $result->fetch_assoc())
       {
           echo '<tr id="'.$row['sid'].'">';
           echo '<td>'.$row['sid'].'</td>';
           echo '<td>'.$row['crop'].'</td>';
           echo  '</tr>';
        }
        echo '</table>';
   } 
  
   
  function checkwater($sensor, $satlevel, $waterdepth, $day, $month, $year, $hour, $minute, $ampm)
   {
       
        global $mysqli;
        $stmt = $mysqli->prepare("INSERT INTO sat_input (sensorid, satlevel, waterdepth, day, month, year, hour, minute, ampm)
        VALUES (?,?,?,?,?,?,?,?,?)");
        $stmt->bind_param('iiiisiiis', $sensor, $satlevel, $waterdepth, $day, $month, $year, $hour, $minute, $ampm);
        $stmt->execute();
        $stmt->close();
        //mycrops();
        //mycrops($waterdepth, $satlevel);
        
   }
  
   function mycrops()
   {
       
        $stmt = $mysqli->prepare("SELECT * FROM croplevel");
        $stmt->execute();
        $output = $stmt->get_result();
        displaysat($result);  
        $stmt->close();
        
   }
   function displaysat($output)
   {//table build from object returned from sql select * query
     
       while($row = $output->fetch_assoc())
       {
           echo '<tr id="'.$row['crop'].'">';
           echo '<td>'.$row['crop'].'</td>';
           echo  '</tr>';
          /*  if($satlevel < $row['satlevel'])
           {
               echo '<tr><td>Saturation Level is Low, Increase irrigation</td></tr>';
           }
           else if($satlevel > $row['satlevel'])
           {
               echo '<tr><td>Saturation Level is High, decrease irrigation</td></tr>';
           } */
        }
        echo '</table>';   
   }
  
  
   /*code segment to check if username and password are valid*/
   
  
   
   
       if(isset($_POST['action']))
       {//set up server queries and updates based on user actions and event listener returns 
       //got tde idea of variable here from Eric Ianni tutoring session 
            $action = $_POST['action'];
            if($action == 'setup')
            {
                setup();
            }
            if($action == 'check')
            {
                    $sensor = $_POST['sid']; 
                    $satlevel = $_POST['sat'];
                    $waterdepth = $_POST['depth'];
                    $day = $_POST['day'];
                    $month = $_POST['month'];
                    $year = $_POST['year'];
                    $hour = $_POST['hour'];
                    $minute = $_POST['min'];
                    $ampm = $_POST['ampm'];
                    if($ampm == 1)
                    {
                        $ampm = 'AM';
                    }
                    else if($ampm == 2)
                    {
                        $ampm = 'PM';
                    }
                    checkwater($sensor, $satlevel, $waterdepth, $day, $month, $year, $hour, $minute, $ampm);
                    
            }
       }
  
   
?>