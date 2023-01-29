<!-- <h1> Example of extract()  </h1>
<h2> This variables are from Model/Plan/Plan.php </h2>
<h2> You selected building: <?php echo $HTML_BULDING_NUMBER; ?> </h2> -->
<h1>Plan</h1>
<p>Budynek: <?php echo $HTML_BULDING_NUMBER; ?></p>
<p>Aktualne piętro: <span> <?php echo $HTML_FLOOR_NUMBER; ?></span></p>
<div>
<!-- buttons -->
<div class="col-12">
<label>Wybierz piętro:</label>
<form action="index.php" method="post">
<?php foreach($HTML_FLOOR_LIST as $floor): ?>
    <input type="submit" name="numerPiętra" value="<?php echo $floor; ?>">
<?php endforeach; ?>
</div>
</form>
    <!-- svg from file -->
    <div class="col-10">
    <?php echo $HTML_SVG_PLAN; ?>
    </div>
    <!-- pop up -->
    <div class="col-2 popup">
        <div class="placeholder">
        <p>Wybierz pokój, <br /> aby otrzymać informacje <br />  dotyczące <br /> przeznaczenia <br />  pomieszczenia.</p>
        </div>
<script type="text/javascript">
    "use strict";
    
    ///////////////////////////////// Variables /////////////////////////////////
    var buldingNumber = "<?php echo $HTML_BULDING_NUMBER; ?>";
    var floorNumber = <?php echo $HTML_FLOOR_NUMBER; ?>;
    var svg_obj_ = document.querySelector("svg");
    var rooms_obj_ = svg_obj_.querySelectorAll("rect[inkscape\\:label^='pok_']");
    var popup_obj_ = document.querySelector(".popup");

    ///////////////////////////////// Functions /////////////////////////////////
    // Create pop up from getIframe
    function createPopUp(roomNumber) {
        getPopUp(buldingNumber, floorNumber, roomNumber);
    }
    // Add events to rooms
    function addEventsToRooms() {
        rooms_obj_.forEach(function (rooms_obj_) {
        rooms_obj_.addEventListener("click", function (e) {
            // get room number
            var roomNumber = e.target.getAttribute("inkscape:label").split("_")[1];
            console.log(roomNumber);
            e.target.style.fill = "red";
            // create pop up
            var popUp = createPopUp(roomNumber);
        });
    });
    }

    // Get current day
    function getCurrentDay() {
        var date = new Date();
        var day = date.getDate();
        var month = date.getMonth() + 1;
        var year = date.getFullYear();
        return year + "-" + month + "-" + day;
    }

    function getPopUp(bulding, floor, room) {
        var url = "./index.php";
        var params = "page=Plan%20PopUp&numerBudynku=" + bulding + "&numerPietra=" + floor + "&numerPokoju=" + room;
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                popup_obj_.innerHTML = xhr.responseText;
            }
        };
        xhr.open("POST", url, true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.send(params);

    }
    ///////////////////////////////// View /////////////////////////////////

    // responsive svg size to window size infinately
    svg_obj_.setAttribute("height", "100%");
    svg_obj_.setAttribute("width", "100%");
    
    // rotate svg by 90 degrees using style if window width is smaller than height
    window.addEventListener("resize", function () {
        if (window.innerWidth < window.innerHeight) {
            svg_obj_.style.transform = "rotate(90deg)";
            // fix margin
            svg_obj_.style.marginTop = "50%";
            svg_obj_.style.marginBottom = "50%";


        } else {
            svg_obj_.style.transform = "rotate(0deg)";
            // fix margin
            svg_obj_.style.marginTop = "0";
            svg_obj_.style.marginBottom = "0";
        }
    });

    ///////////////////////////////// Main /////////////////////////////////
    
    addEventsToRooms();
    // getTeacher("Anna", "Barcz", getCurrentDay(), getCurrentDay());

    

</script>