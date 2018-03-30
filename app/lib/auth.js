import Amplify from 'aws-amplify';

Amplify.configure({
    Auth: {
      identityPoolId: 'us-east-2:6e6e9691-48f2-4f28-8183-94d272df0083',
      region: 'us-east-2',
      userPoolId: 'us-east-2_23G3PTJkb',
      userPoolWebClientId: '6mn6k3rpjoorvtq7etcfg84akm'
   }
 })
export default Amplify
