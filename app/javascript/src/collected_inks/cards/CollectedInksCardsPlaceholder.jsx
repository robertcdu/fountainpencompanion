import React from "react";

export const CollectedInksCardsPlaceholder = () => {
  return (
    <div className="placeholder-glow">
      <div className="d-flex flex-wrap justify-content-end align-items-center mb-3">
        <div className="placeholder bg-primary col-2 me-1" />
        <div className="placeholder bg-primary col-2 me-1" />
        <div className="placeholder bg-primary col-2" />
        <div className="placeholder placeholder-lg col-6 m-2" />
        <div className="placeholder placeholder-lg bg-success col-3" />
      </div>
      <div className="placeholder placeholder-lg col-12" />
      <div className="placeholder placeholder-lg bg-secondary col-12" />
      <div className="placeholder placeholder-lg col-12" />
      <div className="placeholder placeholder-lg bg-secondary col-12" />
      <div className="placeholder placeholder-lg col-12" />
      <div className="placeholder placeholder-lg bg-secondary col-12" />
    </div>
  );
};
