// scheme-model

const db = require('../../data/db-config')

function find() {
    return db('schemes')
}

function findById(id) {
    return db('schemes').where("id", id).first()
}

function findSteps(id) {
    return db('steps')
        .join('schemes', 'schemes.id', 'steps.scheme_id')
        .where('scheme_id', id)
        .select('steps.id', 'schemes.scheme_name', 'steps.step_number', 'steps.instructions')
        .orderBy('steps.step_number')
};
//?? not figured

function add(scheme) {
    return db('schemes').insert(scheme)
    .then(([id]) => {
        return db('schemes').where("id", id).first()
    })
}

function update(id, scheme) {
    const postId =id
    return db('schemes').where("id", id).update(scheme)
    .then(() => {
        return db('schemes').where("id", postId).fist()
    })
}

function remove(id) {
    return db('schemes').where("id", id).del()
    .then(() => {
        return db('schemes')
    })
}

module.exports= {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
}