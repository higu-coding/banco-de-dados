// Estabelecendo conexão com o banco de dados

const { DataTypes } = require('sequelize');
const sequelize = require('./config/database');
const Usuario = require('./models/usuario');

try {
    await sequelize.authenticate(); // Verifica a conexão com o banco de dados
    console.log('Conexão com o banco de dados estabelecida com sucesso.');

    await Usuario.sync(); // Cria a tabela de usuário, se ela não existir

    // CRUD de usuarios - Dados ficticios*

    // C = CREATE
    const novoUsuario = await Usuario.create({
        nome: 'Fernando',
        email: 'fernando@example.com',
        senha: 'fernando123',
    });
    console.log('Usuário inserido com sucesso:', novoUsuario.toJSON());

    // R = READ
    const readUsuario = await Usuario.findAll();
    console.log('Lista de Usuários:', readUsuario.map((u) => u.toJSON()));
    
    // U = UPDATE
    const updateUsuario = await Usuario.findByPk(id);
    await updateUsuario.update({senha: 'senha_forte' }); 
    console.log('Usuário atualizado com sucesso:', updateUsuario.toJSON());

    // D = DELETE
    const deleteUsuario = await Usuario.findByPk(id);
    await updateUsuario.destroy();
    console.log('Usuário excluído com sucesso.');

    // Modelo de Notas - Usando ASSOCIAÇÕES
    const Nota = sequelize.define('Nota', {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
        },
        valor: DataTypes.INTEGER,
        disciplina: DataTypes.STRING
    });

    Usuario.hasMany(Nota);
    Nota.belongsTo(Usuario);

    // Consulta para obter um usuário com suas notas
    Usuario.findByPk(1, {
        include: Nota, //Especifica a inclusão do modelo de nota
    }).then((usuario) => {
        console.log('Usuário:', usuario.toJSON());
        console.log('Notas do usuário:');
        usuario.Notas.forEach((Nota) => {
            console.log('Disciplina:', Nota.disciplina, 'Valor:', Nota.valor);
        });
        console.log('Uusário não encontrado.');
    });
    
} catch (error) {
    console.error('Erro ao conectar/ inserir no banco de dados: ', error);
} finally {
    sequelize.close(); // Fecha a conexão com o banco de dados
}