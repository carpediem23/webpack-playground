import React from 'react';

interface IComponent {
  text?: string;
}

const Component: React.FC<IComponent> = ({ text = 'Component sample' }) => (
  <div>
    <label>{text}</label>
  </div>
);

export default Component;
