module.exports.isLoggedIn = (req, res, next) => {
    if (!req.session.admin) {
        res.redirect('/admin')
        return
    }
    next()
}