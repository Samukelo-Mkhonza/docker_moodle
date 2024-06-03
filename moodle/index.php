<?php
// Basic configuration for Moodle
$CFG = new stdClass();
$CFG->dbtype = getenv('MOODLE_DATABASE_TYPE');
$CFG->dbhost = getenv('MOODLE_DATABASE_HOST');
$CFG->dbname = getenv('MOODLE_DATABASE_NAME');
$CFG->dbuser = getenv('MOODLE_DATABASE_USER');
$CFG->dbpass = getenv('MOODLE_DATABASE_PASSWORD');
?>
