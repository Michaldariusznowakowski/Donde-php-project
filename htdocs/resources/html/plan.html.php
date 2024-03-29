<h1>Plan </h1>
<h4>Budynek: <?php echo $HTML_BULDING_NUMBER; ?> Aktualne piętro: <?php echo $HTML_FLOOR_NUMBER; ?></h4>
<div class="col-12 popup">
        <div class="placeholder">
            <p>Wybierz pokój, <br /> aby otrzymać informacje <br />  dotyczące <br /> przeznaczenia <br />  pomieszczenia.</p>
        </div>
</div>

<!-- svg from file -->
<div class="col-12 map">
    <?php if ($HTML_SVG_PLAN == null) {
        echo "<h1>Brak planu dla tego piętra.</h1>";
    } else {
        echo $HTML_SVG_PLAN;
    } ?>
</div>

<div class="col-12 buttons">
    <label>Wybierz piętro:</label>
    <form action="index.php" method="post">
        <input type="hidden" name="numerBudynku" value="<?php echo $HTML_BULDING_NUMBER; ?>">
        <input type="hidden" name="page" value="Plan">
        <?php foreach($HTML_FLOOR_LIST as $floor): ?>
        <input type="submit" name="numerPietro" value="<?php echo $floor; ?>">
        <?php endforeach; ?>
    </form>
</div>

<script type="text/javascript">
    "use strict";
    
    ///////////////////////////////// Variables /////////////////////////////////
    var buldingNumber = "<?php echo $HTML_BULDING_NUMBER; ?>";
    var floorNumber = <?php echo $HTML_FLOOR_NUMBER; ?>;
    var svg_obj_ = document.querySelector("svg");
    var rooms_obj_ = svg_obj_.querySelectorAll("[inkscape\\:label^='pok_']");
    var popup_obj_ = document.querySelector(".popup");
    var last_selected_room_obj_ = null;
    var room_default_color_ = null;
    if (rooms_obj_.length > 0) {
        room_default_color_ = rooms_obj_[0].style.fill;
    }
    ///////////////////////////////// Functions /////////////////////////////////
    function eventSvgRotate(e) {
        if (600 > window.innerWidth) { 
            svg_obj_.style.transform = "rotate(90deg) scale(3)";
            // fix margin
            svg_obj_.style.marginTop = "130%";
            svg_obj_.style.marginBottom = "130%";

        } else {
            svg_obj_.style.transform = "rotate(0deg)";
            // fix margin
            svg_obj_.style.marginTop = "0";
            svg_obj_.style.marginBottom = "0";
        }
    }
    function event(e) {
        // get room number
        var roomNumber = e.target.getAttribute("inkscape:label").split("_")[1];

        if (last_selected_room_obj_ != null) {
            last_selected_room_obj_.style.fill = room_default_color_;
        }
        e.target.style.fill = "red";
        last_selected_room_obj_ = e.target;
        
        // create pop up
        var popUp = createPopUp(roomNumber);
    }
    // Create pop up on click
    function createPopUp(roomNumber) {
        getPopUp(buldingNumber, floorNumber, roomNumber);
    }
    // Add events to rooms
    function addEventsToRooms() {
        rooms_obj_.forEach(function (rooms_obj_) {
            rooms_obj_.addEventListener("click", event);
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
        var params = "page=Plan%20PopUp&numerBudynku=" + bulding + "&numerPietro=" + floor + "&numerPokoju=" + room;
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

    
    // preserveAspectRatio="xMidYMid meet"
    if (svg_obj_!= null) {
        window.addEventListener("resize", eventSvgRotate);
        svg_obj_.setAttribute("preserveAspectRatio", "xMidYMid meet");
        svg_obj_.style.height = "100%";
        svg_obj_.style.width = "100%";
    }
    

    //run on start
    eventSvgRotate();

    ///////////////////////////////// Main /////////////////////////////////
    
    addEventsToRooms();

    <?php
        if ($HTML_ROOM_NUMBER != null) {
            echo "var room_obj_ = svg_obj_.querySelector(\"[inkscape\\\\:label='pok_" . $HTML_ROOM_NUMBER . "']\");";
            echo "event({target: room_obj_});";
        }
    ?>

    

</script>