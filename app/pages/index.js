import React from 'react'
import { Header } from 'semantic-ui-react'
import Users from '../components/users';
import Amplify from '../lib/auth';
import { withAuthenticator } from 'aws-amplify-react';

const Chatty = ({ }) => (
  <div>
    <Header>Chatty</Header>
    <Users/>
  </div>
)

export default withAuthenticator(Chatty);
