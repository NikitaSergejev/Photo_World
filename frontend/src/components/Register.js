
import React, { useState } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';
import {Container, Form, Button} from 'react-bootstrap';

export default function Register() {
    const [name, setName] = useState('');
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [confPassword, setConfPassword] = useState('');
    const [msg, setMsg] = useState('');
    const navigate = useNavigate();

    const RegisterSubmit = async (e) => {
        e.preventDefault();
        try {
          await axios.post(`http://localhost:5000/users/auth/register`, {
            name: name,
            email: email,
            password: password,
            confPassword: confPassword,
          });
          navigate('/login');
        } catch (error) {
          if (error.response && error.response.data) {
              setMsg(`Error: ${error.response.data.msg}`);
          } else {
              setMsg('Error');
          }
      }
      };
  return (
    <Container className='px-5 mt-3' style={{width: '50%'}}>
        <h2>Register form</h2>
        <Form onSubmit={RegisterSubmit}>
            <p className='has-text-centered'>{msg}</p>
            <Form.Group className="mb-3">
                <Form.Label>Name:</Form.Label>
                <Form.Control 
                type="text" 
                placeholder="Enter your name" 
                value={name}
                onChange={(e) => setName(e.target.value)}
                />
            </Form.Group>
            <Form.Group className="mb-3">
                <Form.Label>Email address:</Form.Label>
                <Form.Control 
                type="email" 
                placeholder="Enter email" 
                value={email}
                onChange={(e) =>setEmail(e.target.value)}
                />
                <Form.Text className="text-muted">
                    We'll never share your email with anyone else.
                </Form.Text>
            </Form.Group>

            <Form.Group className="mb-3" >
                <Form.Label>Password:</Form.Label>
                <Form.Control 
                type="password" 
                placeholder="Password" 
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                />
            </Form.Group>
        
            <Form.Group className="mb-3" >
                <Form.Label>Confirm password:</Form.Label>
                <Form.Control 
                type="password" 
                placeholder="Password" 
                value={confPassword}
                onChange={(e) => setConfPassword(e.target.value)}
                />
            </Form.Group>
            <Button variant="primary" type="submit">
            Register
            </Button>
        </Form>
    </Container>    
  );
}
