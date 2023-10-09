import React, { useState } from "react";

const useModal = () => {

  const [showModal, setShowModal] = useState(false);

  const openModal = () => {
    setShowModal(true);
  }

  const closeModal = () => {
    setShowModal(false);
  }

  const Modal = ({ children }) => {
    if (!showModal) {
      return null;
    }
    return (
      <div class="modal-container">
        <div class="modal-background"></div>
          <div class="modal-content">
            {children}
          </div>
      </div>
    );
    // return (
    //   <div
    //     style={{
    //       position: 'fixed',
    //       top: 0,
    //       left: 0,
    //       right: 0,
    //       bottom: 0,
    //       display: 'flex',
    //       justifyContent: 'center',
    //       alignItems: 'center',
    //     }}
    //   >
    //     <div
    //       style={{
    //         position: 'fixed',
    //         top: 0,
    //         bottom: 0,
    //         left: 0,
    //         right: 0,
    //         backgroundColor: 'gray',
    //         opacity: '0.5',
    //       }}
    //     ></div>
    //     <div style={{ position: 'relative' }}>{children}</div>
    //   </div>
    // );
  };

  return { Modal, openModal, closeModal };
};

export default useModal;

