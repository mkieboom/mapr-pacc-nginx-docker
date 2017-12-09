<?php

// https://stackoverflow.com/questions/12184619/display-latest-image-in-directory-ending-in
$page = $_SERVER['PHP_SELF'];
$sec = "1";

function getLatestImage($folderName, $imageEnding) {
    $newest_mtime = 0;
    $base_url = $folderName;
    $file_ending = $imageEnding;
    $show_file = 'no file';
    if ($handle = opendir($base_url)) {
        while (false !== ($latestFile = readdir($handle))) {
            if (($latestFile != '.') && ($latestFile != '..') && ($latestFile != '.htaccess') && (strpos($latestFile, $file_ending))) {
             $mtime = filemtime("$base_url/$latestFile");
                if ($mtime > $newest_mtime) {
                    $newest_mtime = $mtime;
                    $show_file = "$base_url/$latestFile";
                }
            }
        }
    }
    return $show_file;
}
?>

<html>
    <head>
    <meta http-equiv="refresh" content="<?php echo $sec?>;URL='<?php echo $page?>'">
    </head>
    <body>
    <?php
        $image_filename = getLatestImage('webcam', '.jpg');
        $json_filename = str_replace(".jpg",".json", $image_filename);
        echo $image_filename ."<br>";
        echo '<img src="' . $image_filename . '" alt="Latest from the web"><br>';
        echo date("d-M-Y - G:i:s")."<br>";
        //$json_string = json_encode(file_get_contents($json_filename), JSON_PRETTY_PRINT);
        $json_string = file_get_contents($json_filename);
        echo $json_string;
        echo $json;
    ?>
    </body>
</html>
