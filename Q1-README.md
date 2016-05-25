<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>readme</title>
  </head>
  <body>
    <h1>Q1</h1>
    Q1. You have been asked to restart three services on three different
    machines.<br>
     How do you do it? Describe in words<br>
     If it is 1000 linux servers you need to restart the services, what
    tools and how would<br>
    you do it? Describe in words and any automation tools that you would
    like to use<br>
     After the restart, how would you confirm the restart is actually
    successful? Describe<br>
    in words or any automation tools / scripts &amp; languages<br>
    <br>
    <h2>Answer:</h2>
    <h3>Up to 40 Servers</h3>
    <br>
    Up to 40 Servers I would with a bash script and send a eMail with
    the result. <br>
    suggestion: The user "odm" has a authorized key on the remote
    server, a "ALL = NOPASSWD: ALL" in the sudores file and the local
    server has a mail-command setup<br>
    <br>
    Script:
https://github.com/odm3122/Bash-ssh-server-restart/blob/sshrestart/sshrestart.sh<br>
    <br>
    <br>
    <b>Errors Handling:</b><br>
    <br>
    <i><b>Service failed on restart</b></i><br>
    --------------------------------<br>
    * HOST: 192.168.24.61 <br>
    --------------------------------<br>
    Job for apache2.service failed because the control process exited
    with error code. See "systemctl status apache2.service" and
    "journalctl -xe" for details.<br>
    Connection to 192.168.20.61 closed.<br>
    <br>
    <i><b>StdErr out failed remote server connection</b></i><br>
    --------------------------------<br>
    * HOST: 192.168.20.2 <br>
    --------------------------------<br>
    ssh: connect to host 192.168.20.2 port 22: Connection timed out<br>
    <br>
    <br>
    <b>Additional Restart Success Check<br>
      <br>
    </b>Additioninal I would check the Montoring Tool while I remove the
    Maintenance Flag on the remote servers<br>
    <br>
    <br>
    <h3>On 1000 Servers with a Agent</h3>
    On 1000 Server this is not a good way because ssh will execute the
    commands one by one. On 5 Sec. per restart the restart of 1000
    Servers needs too much time<br>
    <br>
    <h4>In this case I would use Mcollective </h4>
    mco services restart apache2 --with-fact lsbdistcodename=squeeze<br>
    oder<br>
    mco services restart apache2 -I /webserver/<br>
    <br>
    The first command will restart all apache2 deamons on a System&nbsp;
    Debian "squeeze".<br>
    The second command will restart all Servers with "webserver" in the
    hostname.<br>
    <br>
    All the restarts starts at the same time.<br>
    <br>
    The Result is very short an handy:<br>
    ---- service summary ----<br>
    Nodes: 1000 / 1000<br>
    Statuses: restart=1000<br>
    Elapsed Time: 3.81 s<br>
    <br>
    If a System fails I can manage it manually<br>
    <br>
    Downside it needs the Mcollective Agent on every client.<br>
    <br>
    <h3>On 1000 Servers without a Agent</h3>
    In this case I would use a Monitoring Tool PRTG is able to do that.
    I need anyway set a Downtime on the Monitoring Tool why don't do the
    restart via the Monitoring Tool too and check the result on this
    same tool. But the initial setup needs some time you must add a
    script to any node.<br>
    <br>
  </body>
</html>
