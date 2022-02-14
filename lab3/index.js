'use strict';

document.addEventListener('DOMContentLoaded', () => {
  const button = document.getElementById('start');
  const output = document.createElement('div');

  const reqForeach = (elem, iter) => {
    const elements = elem.childNodes;
    let str = '';
    const newIter = iter + 4;
    
    for (let i = 0; i < iter; i++) {
      str += '&nbsp';
    }

    elements.forEach(elem => {
      if (elem.tagName) {
        console.log(elem.tagName);
        const p = document.createElement('p');
        p.innerText = `${str}${elem.tagName}`;
        output.append(p);
        reqForeach(elem, newIter);
      }
    })
    return output;
  }

  button.onclick = () => {
    const parent = document.getElementsByTagName('html');
    const elem = parent[0];
    reqForeach(elem, 0);
    document.body.appendChild(output);
    document.body.removeChild(button);
  }
})