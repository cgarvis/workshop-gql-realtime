import React from 'react'
import { graphql, compose } from 'react-apollo'
import gql from 'graphql-tag'
import { Header } from 'semantic-ui-react'
import withData from '../lib/withData'

import User from './user'

const map = (arr, fn) => arr ? arr.map(fn) : []

const Users = ({ data: { loading, users = {} } }) => (
  <div>
    <Header as="h2">Users</Header>
    <div>
      { map(users.items, u => <User key={u.id} user={u} />) }
    </div>
  </div>
)

const usersQuery = gql`
  query {
    users {
      ...User
    }
  }
  ${User.fragments.User}
`

const enhance = compose(
  withData,
  graphql(usersQuery)
)

export default enhance(Users)
