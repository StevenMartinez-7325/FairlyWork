import React from "react";
import { Form, OverlayTrigger, Popover } from "react-bootstrap";
import { useFormikContext } from "formik";
import * as Icon from "react-feather";
import PropTypes from "prop-types";
import "./surveyform.css";

function TextArea({ questions }) {
  const { handleChange } = useFormikContext();

  const helpMessage = (
    <Popover>
      <Popover.Header>{<strong>Why do we ask this?</strong>}</Popover.Header>
      <Popover.Body>{questions.helpText}</Popover.Body>
    </Popover>
  );
  
  return (
    <Form.Group controlId={questions.id} className=" mt-3">
      <Form.Label>
        {questions.question}
        <OverlayTrigger placement="right" overlay={helpMessage}>
          <Icon.HelpCircle size={18} />
        </OverlayTrigger>
      </Form.Label>
      <Form.Control
        as="textarea"
        size="md"
        name={questions.id}
        className="surveyform-form-group mb-2" 
        rows={2}
        onChange={handleChange}
      ></Form.Control>
    </Form.Group>
  );
}

TextArea.propTypes = {
  questions: PropTypes.shape({
    id: PropTypes.number.isRequired,
    question: PropTypes.string.isRequired, 
    helpText: PropTypes.string.isRequired,
  }),
};

export default TextArea;
