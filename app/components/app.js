import React from 'react'
import Auth from '../lib/auth'
import { withAuthenticator } from 'aws-amplify-react'

import { Header } from 'semantic-ui-react'

const App = ({ }) => (
  <div>
    <Header>Chatty</Header>
  </div>
)

export default withAuthenticator(App, true)
