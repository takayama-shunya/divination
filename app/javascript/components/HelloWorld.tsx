import React from "react";
import PropTypes from "prop-types";

type Props = {
  greeting: string;
  name: string;
};

function HelloWorld({ greeting, name }: Props) {
  return <p>Greeting: {`${greeting} ${name}`}</p>;
}

export default HelloWorld;
