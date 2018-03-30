import dynamic from 'next/dynamic'

const Chatty = dynamic(import("../components/app"))

export default Chatty
