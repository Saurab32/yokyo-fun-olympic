<?php
namespace core\classes;
use PDO;

class DB{
    protected PDO $conn;
    protected string $table="";
    protected string $sql="";
    protected array $where=[];
    protected int $limit=100;
    //offset is used for pagination
    protected int $offset=0;
    protected string $select ="*";
    protected string $orderBy="";
    protected string $orderColumn="";
    protected int $fetchType = PDO::FETCH_OBJ;
    protected array $queryValues = [];

    public function __construct()
    {
        $config =(object) config('database');
        $host= $config->host;
        $user= $config->user;
        $pass= $config->password;
        $dbname= $config->database;
        //pdo connection
        $this->conn = new PDO("mysql:host=$host;dbname=$dbname", $user, $pass);
    }

    public function table($table)
    {
        $this->table = $table;
        return $this;
    }

    public function select($columns = '*')
    {
        $this->select = $columns;
        return $this;
    }

    public function where($column, $operator, $value,$type= "AND")
    {
        $this->queryValues[$column] = $value;
        $this->where[] = [
            'column' => $column,
            'operator' => $operator,
            'value' => $value,
            "type" => $type
        ];
        return $this;
    }

    public function whereOr($column, $operator, $value)
    {
        return $this->where($column, $operator, $value,"OR");
    }

    public function limit($limit)
    {
        $this->limit = $limit;
        return $this;
    }

    public function offset($offset)
    {
        $this->offset = $offset;
        return $this;
    }

    public function orderBy(string $column, string $order = "ASC")
    {
        $this->orderColumn = $column;
        $this->orderBy = $order;
        return $this;
    }

    public function orderByDec(string $column)
    {
        return $this->orderBy($column, "DESC");
    }

    protected  function  generateSql($method="SELECT"){
        $sql = $method." ";
        if($method == "SELECT"){
            $sql .=$this->select." ";
        }
        $sql .= "FROM ".$this->table." ";
        if($this->where){
            $sql .= "WHERE ";
            foreach ($this->where as $key => $where){
                $column = $where['column'];
                $operator = $where['operator'];
                $value = $where['value'];
                $type = $where['type'];
                $sql .= "$column $operator :$column";
                if($key < count($this->where)-1){
                    $sql .= $where['type']." ";
                }
            }
        }
        if($this->limit){
            $sql .= " LIMIT ".$this->limit." ";
        }
        if($this->offset){
            $sql .= " OFFSET ".$this->offset." ";
        }
        return $sql;
    }

    public function get()
    {
        $this->sql = $this->generateSql();
        $stmt = $this->conn->prepare($this->sql);
        $stmt->execute();
        return $stmt->fetchAll($this->fetchType);
    }

    public function first()
    {
        $this->limit(1);
        $this->sql = $this->generateSql();
        $stmt = $this->conn->prepare($this->sql);
        $stmt->execute($this->queryValues);
        return $stmt->fetch($this->fetchType);
    }

    public function delete()
    {
        $this->sql = $this->generateSql("DELETE");
        $stmt = $this->conn->prepare($this->sql);
        return $stmt->execute();
    }

    public function create( array  $data)
    {
        $this->queryValues= array_merge($this->queryValues,$data);
        $columns = implode(", ", array_keys($data));
        $values = implode(", :", array_keys($data));
        if($values){
            $values = ":$values";
        }
        $this->sql = "INSERT INTO ".$this->table." (".$columns.") VALUES (".$values.")";
        $stmt = $this->conn->prepare($this->sql);
        $stmt->execute($this->queryValues);
        $lastId = $this->conn->lastInsertId();
        return $this->init()->table($this->table)->where("id","=",$lastId)->first();
    }

    public function update($date)
    {
        $this->sql = "UPDATE ".$this->table." SET ";
        foreach ($date as $key => $value){
            $this->sql .= "$key = :$key, ";
        }
        $this->sql = rtrim($this->sql,", ");
        $this->sql .= " ".$this->generateSql("UPDATE");
        $stmt = $this->conn->prepare($this->sql);
        return $stmt->execute();
    }

    public static function init()
    {
        return new static();
    }

}