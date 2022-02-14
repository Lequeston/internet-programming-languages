'use strict';

document.addEventListener('DOMContentLoaded', () => {
  const array = [{
      id: 1,
      value: '123'
    },
    {
      id: 2,
      value: '134'
    },
    {
      id: 3,
      value: '152'
    }
  ];

  //тут логика программы
  const logicFunction = (array) => {
    const maxValue = array.reduce((acc, { value }) => {
      const strToSum = (str) => str.split('').reduce((acc, s) => acc + Number.parseInt(s), 0);
      const sumNumbers = strToSum(value);
      const sumAcc = strToSum(acc);
      return sumAcc < sumNumbers ? value : acc;
    }, '0');
    return maxValue;
  }

  //ниже идет код отвечающий за отображение
  const createId = (id) => `input-elem-${id}`;
  const resultP = document.getElementById('result');
  const form = document.getElementById('root-form');
  const warningBlock = document.getElementById('warning');
  const numberValidator = str => /^\d+$/.test(str);
  warningBlock.style = 'display: none !important;';
  const initialValue = array.map(obj => {
    return {...obj}
  });

  const createFormElement = (id, value = '', isLast = true) => {
    const createButtonId = () => `button-${createId(id)}`;
    const createAddButton = (root) => {
      const addButton = document.createElement('button');

      addButton.onclick = (e) => {
        const elem = {
          id: id + 1,
          value: ''
        }
        e.preventDefault();
        console.log(id + 1);
        createFormElement(elem.id, elem.value);
        const button = document.getElementById(createButtonId());
        button.parentNode.removeChild(button);
        array.push(elem);
      }
      addButton.id = createButtonId();
      addButton.textContent = '+';
      addButton.className = 'btn btn-primary';
      root.append(addButton);
    }

    const buttonSubmit = document.getElementById('button-submit');
    const divGroup = document.createElement('div');
    const div = document.createElement('div');
    const errorDiv = document.createElement('div');
    errorDiv.className = 'invalid-feedback';
    div.className = 'mb-3';
    const input = document.createElement('input');
    //const deleteButton = document.createElement('button');
    //deleteButton.className = 'btn btn-danger';
    //deleteButton.textContent = '-';
    input.value = value;
    input.oninput = (e) => {
      e.preventDefault();
      const validation = (value) => {
        if (value.length === 0) {
          return 'Введите пожалуйста значение'
        }
        if (!numberValidator(value)) {
          return 'Вы ввели не число';
        }
        return '';
      }
      const values = e.target.value.split(' ');
      const elem = array.find(({ id: currentId }) => currentId === id);
      elem.value = values[0];
      const validText = validation(values[0]);
      input.value = values[0];
      if (values.length > 1) {
        const button = document.getElementById(createButtonId());
        button.parentNode.removeChild(button);
      }
      if (validText) {
        errorDiv.textContent = validText;
        errorDiv.style = "display: block;"
      } else {
        errorDiv.style = "display: none;"
      }
      const filterValues = values.filter((val) => numberValidator(val))
      for (let i = 1; i < filterValues.length; i++) {
        createFormElement(id + i, filterValues[i], i === (filterValues.length - 1));
        const elem = {
          id: id + i,
          value: filterValues[i]
        }
        array.push(elem);
      }
    }
    input.name = createId(id);
    input.className = 'form-control';
    divGroup.className = 'input-group';
    //divGroup.append(deleteButton);
    divGroup.append(input);
    isLast && createAddButton(divGroup);
    divGroup.append(errorDiv);
    div.append(divGroup);
    buttonSubmit.before(div);
  }
  array.forEach(({ id, value }, index, array) => {
    createFormElement(id, value, (array.length - 1) === index)
  })
  form.onsubmit = (e) => {
    e.preventDefault();
    const notValid = initialValue.length === array.length && array.reduce((calc, { id, value }, index) => {
      const initValue = initialValue[index];
      return calc && value === initValue.value;
    }, true);
    if (notValid) {
      warningBlock.style = 'display: flex !important;';
    } else {
      warningBlock.style = 'display: none !important;';
    }
    console.log(logicFunction(array));
    resultP.textContent = logicFunction(array);
  }
});