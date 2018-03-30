import Amplify from 'aws-amplify';

Amplify.configure({
  Auth: {
    identityPoolId: 'us-east-1:c0bdc293-80ec-40fe-b8ed-ad3bcf2b5d1b',
    region: 'us-east-1',
    userPoolId: 'us-east-2_23G3PTJkb',
  }
})

export default Amplify
