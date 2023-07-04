<?php
namespace core\classes;

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;
class  EmailService{
    public PHPMailer $mail;
    public array $smtp;
    public function __construct()
    {
        $config =config('smtp'); // get smtp config from config/app.php
        $this->smtp = $config;
        $phpmailer = new PHPMailer();
        $phpmailer->isSMTP();
        $phpmailer->SMTPDebug = SMTP::DEBUG_OFF;
        $phpmailer->Host = $config['host'];
        $phpmailer->SMTPAuth = true;
        $phpmailer->Port = $config['port'];
        $phpmailer->Username = $config['username'];
        $phpmailer->Password = $config['password'];
        $this->mail =$phpmailer;
    }

    public function send(string $email, string $name, string $title, string  $body)
    {
        $html = "<div>
            <h1>$title</h1>
            <hr>
            <p>$body</p>
            </div>
         ";
        try {
            //Recipients
            $this->mail->setFrom($this->smtp['username'], $this->smtp['name']);
            $this->mail->addAddress($email, $name);     //Add a recipient
            // Attachments
            // Content
            $this->mail->isHTML(true);
            $this->mail->Subject = $title;
            $this->mail->Body    = $html;
            $this->mail->AltBody = $body;
            $this->mail->send();
            echo true;

        } catch (Exception $e) {
            echo "Message could not be sent. Mailer Error: {$this->mail->ErrorInfo}";
        }
    }
}