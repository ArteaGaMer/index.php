<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET,POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// Conecta a la base de datos  con usuario, contraseña y nombre de la BD
$servidor = "localhost"; $usuario = "root"; $contrasenia = ""; $nombreBaseDatos = "empleados";
$conexionBD = new mysqli($servidor, $usuario, $contrasenia, $nombreBaseDatos);


// Consulta datos y recepciona una clave para consultar dichos datos con dicha clave
if (isset($_GET["consultar"])){
    $sqlEmpleaados = mysqli_query($conexionBD,"SELECT * FROM empleados WHERE id=".$_GET["consultar"]);
    if(mysqli_num_rows($sqlEmpleaados) > 0){
        $empleaados = mysqli_fetch_all($sqlEmpleaados,MYSQLI_ASSOC);
        echo json_encode($empleaados);
        exit();
    }
    else{  echo json_encode(["success"=>0]); }
}
//borrar pero se le debe de enviar una clave ( para borrado )
if (isset($_GET["borrar"])){
    $sqlEmpleaados = mysqli_query($conexionBD,"DELETE FROM empleados WHERE id=".$_GET["borrar"]);
    if($sqlEmpleaados){
        echo json_encode(["success"=>1]);
        exit();
    }
    else{  echo json_encode(["success"=>0]); }
}
//Inserta un nuevo registro y recepciona en método post los datos de nombre y correo
if(isset($_GET["insertar"])){
    $data = json_decode(file_get_contents("php://input"));
    $nombre=$data->nombre;
    $fecha_nacimiento=$data-> fecha_nacimiento;
    $telefono=$data-> telefono;
    $email=$data->email;

    $calle=$data->calle;
    $numero=$data->numero;
    $colonia=$data->colonia;
    $ciudad=$data->ciudad;
    $codigo_postal=$data->codigo_postal;
        if(($email!="")&&($nombre!="")&&($fecha_nacimiento!="")){
            
    $sqlEmpleaados = mysqli_query($conexionBD,"INSERT INTO empleados(nombre,fecha_nacimiento,telefono,email) VALUES('$nombre','$fecha_nacimiento','$telefono','$email') ");
    $id_empleado = mysqli_insert_id($conexionBD);
    $sqlDireccion = mysqli_query($conexionBD,"INSERT INTO direccion(id_empleado,calle,numero,colonia,ciudad,codigo_postal) VALUES('$id_empleado','$calle','$numero','$colonia','$ciudad','$codigo_postal') ");
    echo json_encode(["success"=>1]);
        }
    exit();
}
// Actualiza datos pero recepciona datos de nombre, correo y una clave para realizar la actualización
if (isset($_GET["actualizar"])) {
    $data = json_decode(file_get_contents("php://input"));

    $id = (isset($data->id)) ? $data->id : $_GET["actualizar"];
    $nombre = $data->nombre;
    $fecha_nacimiento = $data->fecha_nacimiento;
    $telefono = $data->telefono;
    $email = $data->email;
    $calle = $data->calle;
    $numero = $data->numero;
    $colonia = $data->colonia;
    $ciudad = $data->ciudad;
    $codigo_postal = $data->codigo_postal;

    $sqlEmpleados = mysqli_query($conexionBD, "UPDATE empleados SET nombre='$nombre', fecha_nacimiento='$fecha_nacimiento', telefono='$telefono', email='$email' WHERE id='$id'");
    if ($sqlEmpleados) {
        $sqlDireccion = mysqli_query($conexionBD, "UPDATE direccion SET id_empleado='$id', calle='$calle', numero='$numero', colonia='$colonia', ciudad='$ciudad', codigo_postal='$codigo_postal' WHERE id_empleado='$id'");
        echo json_encode(["success" => 1]);
    } else {
        echo json_encode(["success" => 0, "message" => "Error al actualizar empleado"]);
    }
    exit();
}
// Consulta todos los registros de la tabla empleados
$sqlEmpleaados = mysqli_query($conexionBD,"SELECT e.id, e.nombre, e.fecha_nacimiento, e.telefono, e.email, d.calle, d.numero, d.colonia, d.ciudad, d.codigo_postal, CONCAT(d.calle, ' ', d.numero, ' ', d.colonia, ' ', d.ciudad, ' ', d.codigo_postal) AS direccion_completa, e.f_registro FROM empleados e LEFT JOIN direccion d ON e.id = d.id_empleado");
if(mysqli_num_rows($sqlEmpleaados) > 0){
    $empleaados = mysqli_fetch_all($sqlEmpleaados,MYSQLI_ASSOC);
    echo json_encode($empleaados);
}
else{ echo json_encode([["success"=>0]]); }


?>
