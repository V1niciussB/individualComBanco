var express = require("express");
var router = express.Router();

var usuarioController = require("../controllers/usuarioController");

router.get("/", function (req, res) {
    usuarioController.testar(req, res);
});

router.get("/listar", function (req, res) {
    usuarioController.listar(req, res);
});

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/cadastrar", function (req, res) {
    usuarioController.cadastrar(req, res);
})

router.post("/autenticar", function (req, res) {
    usuarioController.entrar(req, res);
});

// rota dos filtros
router.get("/selectComp/:filtro", function (req, res) {
    usuarioController.selectComp(req, res)
})

router.get("/selectGenero", function (req, res){
    usuarioController.selectGenero(req, res)
})

router.get("/selectModali", function(req, res){
    usuarioController.selectModali(req, res)
})

module.exports = router;