import React from 'react'
import gql from 'graphql-tag'

const User = ({ user }) => (
  <p> { user.username } </p>
)

User.fragments = {
  User: gql`
    fragment User on User {
      username
      cognitoId
    }`
  }

export default User