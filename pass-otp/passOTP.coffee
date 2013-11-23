Template.entryResetPassword.helpers
  error: -> Session.get('entryError')

  logo: ->
    Meteor.call('entryLogo')

Template.entryResetPassword.events

  'submit #passOTP': (event) ->
    event.preventDefault()
    otp = $('input[name="otp"]').val()
    Accounts.resetPassword Session.get('resetToken'), password, (error) ->
      if error
        Session.set('entryError', (error.reason || "Unknown error"))
      else
        Session.set('resetToken', null)
        Router.go AccountsEntry.settings.dashboardRoute
