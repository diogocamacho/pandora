import React from "react";
import { Card, CardContent } from "@/components/ui/card";
import { ArrowRight, Users, Network } from "lucide-react";

export default function DataSciencesOrgMap() {
  return (
    <div className="p-6 grid gap-6">
      {/* Title */}
      <h1 className="text-2xl font-bold text-center">
        Computational Biology + ML Department Org Map
      </h1>

      {/* Top-level leadership */}
      <div className="flex justify-center">
        <Card className="bg-blue-100 shadow-md rounded-2xl p-4 w-80 text-center">
          <CardContent>
            <h2 className="font-semibold text-lg">CSO / CTO</h2>
            <p className="text-sm text-gray-600">Department Reports Up</p>
          </CardContent>
        </Card>
      </div>

      {/* Department Head */}
      <div className="flex justify-center">
        <Card className="bg-white shadow-md rounded-2xl p-4 w-96 text-center border">
          <CardContent>
            <h2 className="font-semibold text-lg">Head of Computational Biology + ML</h2>
            <p className="text-sm text-gray-600">Functional Leadership & Strategy</p>
          </CardContent>
        </Card>
      </div>

      {/* Split Tracks */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        {/* Embedded Track */}
        <Card className="bg-green-50 shadow rounded-2xl p-4">
          <CardContent>
            <h3 className="font-semibold text-lg flex items-center gap-2">
              <Users className="h-5 w-5 text-green-600" /> Embedded Track
            </h3>
            <p className="text-sm text-gray-700 mb-3">
              Computational Biologists embedded into program/project teams.
            </p>
            <ul className="list-disc pl-6 text-sm space-y-1">
              <li>Associate → Scientist → Senior Scientist → Principal Scientist</li>
              <li>Accountable for program-level analyses at stage-gates</li>
              <li>Deep biology + data integration expertise</li>
            </ul>
          </CardContent>
        </Card>

        {/* Central Track */}
        <Card className="bg-purple-50 shadow rounded-2xl p-4">
          <CardContent>
            <h3 className="font-semibold text-lg flex items-center gap-2">
              <Network className="h-5 w-5 text-purple-600" /> Central Track
            </h3>
            <p className="text-sm text-gray-700 mb-3">
              ML & Infra specialists maintaining core pipelines and data platforms.
            </p>
            <ul className="list-disc pl-6 text-sm space-y-1">
              <li>Engineer → Senior Engineer → Staff Engineer → Principal Engineer</li>
              <li>Accountable for reproducibility, infra adoption, regulatory readiness</li>
              <li>Cross-program leverage and efficiency</li>
            </ul>
          </CardContent>
        </Card>
      </div>

      {/* Shared Leadership Council */}
      <div className="flex justify-center">
        <Card className="bg-yellow-50 shadow-md rounded-2xl p-4 w-full md:w-2/3 text-center">
          <CardContent>
            <h3 className="font-semibold text-lg">Departmental Leadership Council</h3>
            <p className="text-sm text-gray-700">
              Senior/Principal staff from both tracks. Influences hiring, budget, and strategy.
            </p>
          </CardContent>
        </Card>
      </div>
    </div>
  );
}
