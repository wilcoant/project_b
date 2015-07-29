window.onload = function () {
    document.getElementById("sensorbutton").addEventListener("click", checklevel);
    requestcrops('action=setup');
};

function checklevel(){
    requestcrops('action=check');
    
};
function requestcrops(statement)
{//ie7, chrome, ff, opera, safarialert("hello");
    //alert("hello");
    var xmlhttp;
    if(window.XMLHttpRequest)
    {
        xmlhttp = new XMLHttpRequest();
    }
    else
    {//legacy browsers
        xmlhttp =  new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function()
    {
        if(xmlhttp.readyState === 4 && xmlhttp.status === 200)
        {
            var serv = xmlhttp.responseText;
            if(statement === 'action=setup'){
               //alert('count these');
               document.getElementById('crops').innerHTML = serv; //put response from server in inner html of id inventory 
              // newListeners(); //add event listerners to list of inventory after returned
                
            }
            if(statement == 'action=check')
            {
                var test = xmlhttp.responseText;
                document.getElementById('results').innerHTML = test;
                var addreq = document.getElementById('checklevel');  
            
                var sensid = parseInt(addreq.elements['sid'].value, 10);
                statement += '&sid=' + sensid;
                var satlevel = parseInt(addreq.elements['sat'].value, 10);
                statement += '&sat=' + satlevel;
                var depthlevel = parseInt(addreq.elements['depth'].value, 10);
                statement += '&depth=' + depthlevel;
                var dateday = parseInt(addreq.elements['day'].value, 10);
                statement += '&day=' + dateday;
                statement += '&month=' + addreq.elements['month'].value; 
                var dateyear = parseInt(addreq.elements['year'].value, 10);
                statement += '&year=' + dateyear;
                var timehour = parseInt(addreq.elements['hour'].value, 10);
                statement += '&hour=' + timehour;
                var timemin = parseInt(addreq.elements['minute'].value, 10);
                statement += '&min=' + timemin;
                var ampm = parseInt(addreq.elements['ampm'].value, 10);
                statement += '&ampm=' + ampm;
                console.log(statement);
            } 
            
          
           
        }
    }//exit xmlhhtp fn 
    
    
          
    
   
    xmlhttp.open("POST", 'waterdbase.php', true);
    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xmlhttp.send(statement);
 };
