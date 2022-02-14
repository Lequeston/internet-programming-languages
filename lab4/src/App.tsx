import React, { useState, useEffect } from 'react';
import { Form, Input, Button, Layout, Table, Space } from 'antd';
import 'antd/dist/antd.css';
import classes from './App.module.scss';
import { v4 as uuidv4 } from 'uuid';

const { Content } = Layout;

type Product = {
  id: string;
  name: string;
  price: string;
};

type SelectProduct = Product & {
  value: number;
};

const App = () => {
  const [data, setData] = useState<Product[]>([]);
  const [selectProducts, setSelectProducts] = useState<SelectProduct[]>([]);
  const [sumPrice, setSumPrice] = useState<number>(0);
  const [color, setColor] = useState('white');
  useEffect(() => {
    setSumPrice(
      selectProducts.reduce(
        (acc: number, { value, price }: SelectProduct) => acc + value * Number.parseInt(price),
        0
      )
    );

    alert('heh');
  }, [selectProducts]);

  const onDelete = (id: string) => {
    const newData = [...data];
    const newSelectProducts = [...selectProducts];
    const index = newData.findIndex((product) => product.id === id);
    const indexSelectProduct = newSelectProducts.findIndex((product) => product.id === id);
    setData([...newData.slice(0, index), ...newData.slice(index + 1, newData.length)]);
    setSelectProducts([
      ...newSelectProducts.slice(0, indexSelectProduct),
      ...newSelectProducts.slice(indexSelectProduct + 1, newSelectProducts.length)
    ]);
  };

  const onAddProduct = (product: Product) => {
    const index = selectProducts.findIndex(({ id }) => id === product.id);
    const newSelectProducts = [...selectProducts];
    if (index !== -1) {
      newSelectProducts[index].value++;
    } else {
      newSelectProducts.push({ ...product, value: 1 });
    }
    setSelectProducts(newSelectProducts);
  };
  const columns = [
    {
      title: 'Наименование товара',
      dataIndex: 'name',
      key: 'name'
    },
    {
      title: 'Цена товара',
      dataIndex: 'price',
      key: 'price',
      render: (price: string) => {
        return (
          <p
            style={{ backgroundColor: color }}
            onFocus={() => setColor('red')}
            onBlur={() => setColor('white')}
          >
            {price}
          </p>
        );
      }
    },
    {
      title: '',
      dataIndex: 'id',
      render: (_: any, product: Product) => (
        <Space>
          <Button type='link' onClick={() => onAddProduct(product)}>
            Добавить
          </Button>
          <Button type='link' onClick={() => onDelete(product.id)}>
            Удалить
          </Button>
        </Space>
      )
    }
  ];

  const selectColumns = [
    {
      title: 'Наименование товара',
      dataIndex: 'name',
      key: 'name'
    },
    {
      title: 'Цена товара',
      dataIndex: 'price',
      key: 'price'
    },
    {
      title: 'Кол-во',
      dataIndex: 'value',
      key: 'value'
    }
  ];

  const onFinish = (values: any) => {
    const newProduct: Product = {
      id: uuidv4(),
      name: values.name,
      price: values.price
    };
    setData((data) => {
      return data.find(({ name, price }) => name === values.name && price === values.price)
        ? data
        : [...data, newProduct];
    });
  };

  const onFinishFailed = (errorInfo: any) => {
    console.log('Failed:', errorInfo);
  };

  return (
    <Layout className={classes.center}>
      <Content className={classes.root}>
        <Space direction='vertical' className={classes.container}>
          <Form
            className={classes.form}
            labelCol={{ span: 10 }}
            wrapperCol={{ span: 16 }}
            onFinish={onFinish}
            onFinishFailed={onFinishFailed}
            autoComplete='off'
            initialValues={{
              name: '',
              price: '0'
            }}
          >
            <Form.Item
              label='Наименование товара'
              name='name'
              rules={[{ required: true, message: 'ВВедите название товара!' }]}
            >
              <Input />
            </Form.Item>

            <Form.Item
              label='Цена товара'
              name='price'
              rules={[{ required: true, message: 'ВВедите цену товара' }]}
            >
              <Input prefix='₽' type='number' />
            </Form.Item>

            <Form.Item wrapperCol={{ offset: 8, span: 16 }}>
              <Button type='primary' htmlType='submit'>
                Добавить
              </Button>
            </Form.Item>
          </Form>
          <Table columns={columns} dataSource={data} pagination={false} />
          <Table
            columns={selectColumns}
            dataSource={selectProducts}
            pagination={false}
            summary={() => (
              <Table.Summary fixed>
                <Table.Summary.Row>
                  <Table.Summary.Cell index={0}>Сумма</Table.Summary.Cell>
                  <Table.Summary.Cell index={1}>{sumPrice}</Table.Summary.Cell>
                </Table.Summary.Row>
              </Table.Summary>
            )}
          />
        </Space>
      </Content>
    </Layout>
  );
};

export default App;
