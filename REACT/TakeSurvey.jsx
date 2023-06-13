import React, { useEffect, useState } from "react";
import { Col, Row, Container, Button, Card } from "react-bootstrap";
import { Formik, Form } from "formik";
import { useParams } from "react-router";
import { Outlet, useNavigate } from "react-router-dom";
import Swal from "sweetalert2";
import PropTypes from "prop-types";
import toastr from "toastr";
import surveyService from "../../services/surveyService";
import debug from "sabio-debug";
import Footer from "../Footer";
import CheckBox from "./CheckBox";
import TextArea from "./TextArea";
import Content from "../Content";

const _logger = debug.extend("TakeSurvey");

function TakeSurvey(props) {
  const [initialValues, setIntitialValues] = useState({});
  _logger(initialValues);

  const surveyId = useParams();
  const navigate = useNavigate();
  const [payload, setPayload] = useState({
    surveyId: surveyId.id,
    userId: props.currentUser.id,
  });
  _logger(payload);
  const mapQuestions = (element) => {
    if (element.isMultipleAllowed === true) {
      return <CheckBox key={element.id} question={element} />;
    } else {
      return <TextArea key={element.id} questions={element} />;
    }
  };

  const onSubmit = async (values) => {
    const surveyAnswers = Object.entries(values);
    let data = surveyAnswers.map(([key, val] = entry) => {
      const obj = {
        instanceId: payload.instanceId,
        questionId: key,
        answerOptionId: isNaN(val) ? null : parseInt(val),
        answer: isNaN(val) ? val : null,
      };
      surveyService
        .insertAnswer(obj)
        .then(onSubmitAnswersSuccess)
        .catch(onSubmitAnswersError);
      return obj;
    });
    Swal.fire({
      title: "Thank you for the feedback!",
      icon: "success",
      confirmButtonText: '<i class="fa fa-thumbs-up"></i> Great!',
    }).then((result) => {
      if (result.isConfirmed) {
        navigate("/");
      }
    });
    _logger(surveyAnswers, data);
  };

  const onGetSurveyByIdSuccess = (response) => {
    _logger(response.items);
    const survey = response.items;

    surveyService
      .createSurveyInstance(payload)
      .then(onSurveyInstanceSuccess)
      .catch(onSurveyInstanceError);

    setIntitialValues((prevState) => {
      const surveyState = { ...prevState };
      surveyState.questions = survey;
      surveyState.questionsComp = survey.map(mapQuestions);
      surveyState.surveyInfo = survey[0].surveyName;
      return surveyState;
    });
  };

  const onGetSurveyByIdError = (err) => {
    _logger(err);
    toastr.error("Survey Not Found");
  };

  const onSurveyInstanceSuccess = (response) => {
    _logger(response);
    setPayload((prevState) => {
      const payload = { ...prevState };
      payload.instanceId = response.item;
      return payload;
    });
  };

  const onSurveyInstanceError = (err) => {
    _logger(err);
  };

  const onSubmitAnswersSuccess = (response) => {
    _logger(response);
  };

  const onSubmitAnswersError = (err) => {
    _logger(err);
  };

  useEffect(() => {
    surveyService
      .getSurveyQuestionsById(surveyId.id)
      .then(onGetSurveyByIdSuccess)
      .catch(onGetSurveyByIdError);
  }, []);

  return (
    <>
      <Content>
        <Container className="container-fluid p-0">
          <Row className="justify-content-center">
            <Col className="col-lg-8 col-md-8">
              <Formik initialValues={initialValues} onSubmit={onSubmit}>
                <Form>
                  <Card className="align-items-center">
                    <Card.Header>
                      <Card.Title className="text-center">
                        {initialValues.surveyInfo}
                      </Card.Title>
                    </Card.Header>
                    <Card.Body>{initialValues.questionsComp}</Card.Body>
                    <div className="d-grid d-md-flex justify-content-md-end">
                      <Button className="med-md-2 mb-3" type="submit">
                        Submit
                      </Button>
                    </div>
                  </Card>
                </Form>
              </Formik>
            </Col>
          </Row>
        </Container>
        <Outlet />
      </Content>
      <Footer />
    </>
  );
}
TakeSurvey.propTypes = {
  currentUser: PropTypes.shape({
    id: PropTypes.number.isRequired,
    email: PropTypes.string.isRequired,
  }),
};
export default TakeSurvey;
