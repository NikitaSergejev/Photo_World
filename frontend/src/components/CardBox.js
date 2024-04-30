import React from 'react';
import {Container} from 'react-bootstrap';
import {Row, Col} from 'react-bootstrap';
import Card from 'react-bootstrap/Card';
import photo from '../assets/photographer.jpg';

export default function CardBox() {
    const[service, setService] = React.useState([]);

    React.useEffect(() => {
        fetch(`https://657aa6131acd268f9afb70a0.mockapi.io/Services`)
        .then((res) => {
            return res.json();
        })
        .then((arr) => {
            setService(arr);
        });
    }, []);
  return (
    <Container fluid className="mt-4 bg-light">
      <Row>
        <Col md={{ span: 8, offset: 2 }} className="text-center">
          <img src={photo} width="420" height="470" alt="Photographer" />
        </Col>
      </Row>
      <Row className="justify-content-md-center">
        {service.map((data) => (
          <Col key={data.id} md={4}>
            <Card className="m-2">
              <Card.Body>
                <Card.Title>{data.name}</Card.Title>
                <Card.Text>{data.description}</Card.Text>
              </Card.Body>
            </Card>
          </Col>
        ))}
      </Row>
    </Container>
  )
}
