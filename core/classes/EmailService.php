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
        $config =env();
        $this->smtp = $config['smtp'];
        $this->mail = new PHPMailer(true);
        $this->mail->SMTPDebug = SMTP::DEBUG_OFF;                      //Enable verbose debug output
        $this->mail->isSMTP();                                            //Send using SMTP
        $this->mail->Host       = getenv("SMTP_HOST");                          //Set the SMTP server to send through
        $this->mail->SMTPAuth   = true;                                   //Enable SMTP authentication
        $this->mail->Username   = getenv("SMTP_USERNAME");;                      //SMTP username
        $this->mail->Password   = getenv("SMTP_PASSWORD");;                      //SMTP password
        $this->mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
        $this->mail->Port       = getenv("SMTP_PORT");;                          //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`
    }

    public function send($address_mail,$name,$title,$body)
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
            $this->mail->addAddress($address_mail, $name);     //Add a recipient
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