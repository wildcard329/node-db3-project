const db = require("../data/db-config.js");
module.exports = {
    find,
    findById,
    add,
    update,
    remove,
    findSteps
}

function find() {
    return db('schemes');
}

function findById(id) {
    return db('schemes').where({id}).first();
}

function add(scheme) {
    return db('schemes')
    .insert(scheme, "id")
    .then((id => {
        return findById(id);
    }));
}

function update(changes, id) {
    return db("schemes")
    .where({ id })
    .update(changes)
};

function remove(id) {
    return db("schemes")
        .where({id})
        .del();
};

function findSteps(id) {
    return db("schemes as sc")
        .join("steps as st", "sc.id", "st.step_number")
        .select("sc.scheme_name as scheme_name", "st.step_number as step_number", "st.instructions as instructions")
        .where({"sc.id": id})
}