import React from "react";
import { Form, OverlayTrigger, Popover } from "react-bootstrap";
import * as Icon from "react-feather";
import PropTypes from "prop-types";
import { useFormikContext } from "formik";

function CheckBox({ question }) {
  const { handleChange } = useFormikContext();

  const helpMessage = (
    <Popover placement="left">
      <Popover.Header>{<strong>Why do we ask this?</strong>}</Popover.Header>
      <Popover.Body>{question.helpText}</Popover.Body>
    </Popover>
  );

  const mapFormCheck = (element) => {
    return (
      <Form.Check
        key={`"AnswerId "${element.id}`}
        name={element.questionId}
        as="input"
        value={element.id}
        inline
        label={element.text}
        onChange={handleChange}
        type="checkbox"
      />
    );
  };

  return (
    <Form.Group className="mb-3 ">
      <Form.Label htmlFor={question.id}>
        {question.question}
        <OverlayTrigger overlay={helpMessage}>
          <Icon.HelpCircle size={20} />
        </OverlayTrigger>
      </Form.Label>
      <div></div>
      {question.answerOptions.map(mapFormCheck)}
    </Form.Group>
  );
}

CheckBox.propTypes = {
  question: PropTypes.shape({
    answerOptions: PropTypes.arrayOf(PropTypes.shape({})),
    id: PropTypes.number.isRequired,
    question: PropTypes.string.isRequired,
    helpText: PropTypes.string.isRequired,
  }),
};

export default CheckBox;
