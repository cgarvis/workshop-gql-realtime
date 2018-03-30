import React from 'react'
import Auth from '../lib/auth'
import { withAuthenticator } from 'aws-amplify-react'
import Users from './users'

import { Header } from 'semantic-ui-react'

const App = ({ }) => (
  <div>
    <Header>Chatty</Header>
    <Users />
  </div>
)

export default withAuthenticator(App, true)
