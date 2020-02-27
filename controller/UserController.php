<?php


namespace controller;


use core\Controller;
use core\View;
use model\db\UserModelDb;
use model\UserModel;

class UserController extends Controller
{
    public function __construct()
    {
        $this->model = new UserModelDb();
        $this->view = new View();
    }


    public function registrationAction()
    {
        $user = $this->regValidation();
        $this->model->regUser($user);
        header('Location: /');
    }

    private function regValidation()
    {
        if(isset($_POST['f_name']) && isset($_POST['l_name']) && isset($_POST['email']) && isset($_POST['password']))
        {
            $user = new UserModel();
            $f_name = $_POST['f_name'];
            $l_name = $_POST['l_name'];
            $email = $_POST['email'];
            $password = $_POST['password'];
            $password2 = $_POST['password2'];

            if(!(strlen($f_name) >= 4 && strlen($f_name) < 20)){
                die('Your name must be between 4 and 20 character');
            }

            if(!(strlen($l_name) >= 4 && strlen($l_name) < 20)){
                die('Your surname must be between 4 and 20 character');
            }

            if(!(filter_var($email, FILTER_VALIDATE_EMAIL) && strlen($email) < 45)){
                die('Email invalid');
            }

            if(!(strlen($password) >= 6 && strlen($password) < 20)){
                die('Your password must be between 6 and 20 character');
            }

            if(!($password === $password2)){
                die('Passwords do not match');
            }

            if(!(ctype_alnum($f_name) && ctype_alnum($l_name))){
                die();
            }

            $user->setName(htmlentities($_POST['f_name']));
            $user->setSurname(htmlentities($_POST['l_name']));
            $user->setEmail(htmlentities($_POST['email']));
            $user->setPassword(password_hash($_POST['password'], PASSWORD_DEFAULT));
            return $user;
        }
    }

    public function authorizationAction()
    {
        if(!empty($_POST['email']) && !empty($_POST['password'])){
            $email = $_POST['email'];
            $password = $_POST['password'];

            if(!(is_string($email) && is_string($password))){
                die('Type is wrong');
            }

            if(!(filter_var($email, FILTER_VALIDATE_EMAIL) && strlen($email) < 45)){
                die('Email invalid');
            }

            if(!(strlen($password) >= 6 && strlen($password) < 20)){
                die('Your password must be between 6 and 20 character');
            }

            $user = new UserModel();
            $user->setEmail(htmlentities($email));
            $user->setPassword($password);

            $result = $this->model->authUser($user)[0];

            if($result){
                $id = $result['id'];

                if (password_verify($_POST['password'], $result['password'])) {
                    $_SESSION['user_id'] = $id;

                    if(!($result['enable'] == 1)){
                        die('You are block!');
                    }

                    if($result['status'] === 'admin'){
                        $_SESSION['role'] = 'admin';
                        $this->view->generate('view/admin/admin_panel_view.php',
                            'main_template.php');
                    }

                    if(!isset($_SESSION['csrf_token']))
                    {
                        $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
                    }

                    echo 'Authorization success';
                    } else {
                        die('Email or Password is wrong');
                    }
                } else {
                    die('Email or Password is wrong');
                }
            }
    }

    public function logoutAction()
    {
        session_destroy();
        header('Location: /');
    }

    public function regAction()
    {
        $this->view->generate('view/reg_view.php', 'main_template.php');
    }

    public function authAction()
    {
        $this->view->generate('view/auth_view.php', 'main_template.php');
    }
}