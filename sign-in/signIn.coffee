Template.entrySignIn.helpers
  emailInputType: ->
    if Accounts.ui._options.passwordSignupFields is 'EMAIL_ONLY'
      'email'
    else
      'string'

  emailPlaceholder: ->
    fields = Accounts.ui._options.passwordSignupFields

    if _.contains([
      'USERNAME_AND_EMAIL'
      'USERNAME_AND_OPTIONAL_EMAIL'
      ], fields)
      return 'Username or email'

    return 'Email'

  logo: ->
    AccountsEntry.settings.logo

Template.entrySignIn.events
  'submit #signIn': (event) ->
    event.preventDefault()
    Session.set('email', $('input[name="email"]').val())
    Session.set('password', $('input[name="password"]').val())

    Meteor.loginWithPassword(Session.get('email'), Session.get('password'), (error)->
      if error
        Session.set('entryError', error.reason)
      else
        if AccountsEntry.settings.otp.enabled
            Router.go 'entryPassOTP'
        else
            Router.go AccountsEntry.settings.dashboardRoute
    )
